# MERN DevOps Platform

Containerized React and Express services with local Docker Compose, GitHub Actions, Kubernetes/Helm deployment, Terraform, and Prometheus/Grafana monitoring.

## Components

- `Frontend/`: React/Vite production build served by unprivileged Nginx on port 8080. Nginx proxies `/api/` and `/health` to the backend.
- `Backend/`: Express service on port 3000 with `/health`, `/health/live`, `/health/ready`, and Prometheus `/metrics` endpoints.
- `docker-compose.yaml`: Local frontend, backend, MongoDB, Prometheus, and Grafana stack.
- `k8s/` and `helm/mern-app/`: Kubernetes resources and a configurable Helm chart.
- `terraform/`: Parameterized AWS EC2 instance configuration. It does not create a Kubernetes cluster.
- `monitoring/`: Prometheus scrape and alert rules plus a provisioned Grafana dashboard.

The backend currently provides health and metrics endpoints; MongoDB is available in Compose but application persistence/authentication is not implemented yet.

## Local development

Prerequisites: Docker with the Compose plugin, or Node.js 22+ and npm.

Start the full local stack:

```bash
docker compose -f docker-compose.yaml up --build -d
```

URLs:

| Service | URL |
|---|---|
| Frontend | http://localhost:5173 |
| Backend health | http://localhost:5000/health |
| Prometheus | http://localhost:9090 |
| Grafana | http://localhost:3001 |

Grafana's local-only default password is `change-me-now`. Set `GRAFANA_ADMIN_PASSWORD` before starting Compose to override it. Do not use the default in a shared or production environment.

Stop the stack with `docker compose -f docker-compose.yaml down`; add `-v` only when intentionally deleting the MongoDB and Grafana data volumes.

Run checks without Docker:

```bash
cd Backend
npm ci
npm test

cd ../Frontend
npm ci
npm run lint
npm run build
```

The helper scripts target the local Compose services:

```bash
bash scripts/health-check.sh
bash scripts/load-test.sh http://localhost:5000/health 25
python scripts/recovery.py backend
```

The load test sends sequential requests (maximum 1,000); the recovery helper requires `kubectl` access to the selected cluster.

## CI and image publishing

`.github/workflows/ci.yaml` runs backend tests and frontend lint/build checks. `.github/workflows/docker-build.yaml` builds both images for pull requests and publishes immutable `sha-<commit>` tags plus `latest` to GHCR on pushes to `main`.

The image names are:

```text
ghcr.io/<owner>/mern-backend
ghcr.io/<owner>/mern-frontend
```

For cluster deployment, make the GHCR packages public or configure image-pull credentials in the cluster. Add a repository Actions secret named `KUBE_CONFIG` containing the target cluster kubeconfig, configure a `production` GitHub environment, and ensure the runner can reach the cluster. `.github/workflows/deploy.yaml` applies `k8s/` and rolls out the immutable images after a successful main-branch image build.

The Kubernetes frontend is exposed through NodePort `30080`; the backend stays internal. The cluster must have the metrics-server installed for CPU-based HPAs to scale pods.

Use the Helm chart with your image tags:

```bash
helm upgrade --install mern-app ./helm/mern-app \
  --namespace mern-app --create-namespace \
  --set backend.image.repository=ghcr.io/<owner>/mern-backend \
  --set backend.image.tag=latest \
  --set frontend.image.repository=ghcr.io/<owner>/mern-frontend \
  --set frontend.image.tag=latest
```

## Terraform

Terraform creates a single EC2 instance only; networking, Kubernetes, and application deployment are not provisioned. Supply an AMI valid for the selected region, review the plan, and check estimated costs before applying:

```bash
cd terraform
terraform init
terraform validate
terraform plan -var="ami_id=<region-specific-ami>"
```

## Security notes

- Keep cloud credentials, kubeconfigs, `.env` files, and Terraform state out of version control.
- Review Terraform plans before applying and use a least-privilege AWS identity.
- Change local Grafana credentials for shared environments.
- Configure GHCR pull access for private images and restrict production environment deployment permissions.
