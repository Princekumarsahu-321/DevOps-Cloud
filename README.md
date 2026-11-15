# 🚀 End-to-End DevOps Automation Platform

![DevOps](https://img.shields.io/badge/Domain-DevOps-blue)
![Docker](https://img.shields.io/badge/Docker-Containerization-2496ED?logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?logo=kubernetes&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-Infrastructure-7B42BC?logo=terraform&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-2088FF?logo=githubactions&logoColor=white)
![Prometheus](https://img.shields.io/badge/Monitoring-Prometheus-E6522C?logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Dashboard-Grafana-F46800?logo=grafana&logoColor=white)

**An end-to-end DevOps automation platform that containerizes and deploys a MERN application using Docker, GitHub Actions, Kubernetes, Helm, Terraform, Prometheus, and Grafana.**

The project demonstrates modern DevOps practices, including automated testing, container image publishing, Kubernetes deployment, infrastructure provisioning, application health checks, monitoring, and operational automation.

---

## 📌 Table of Contents

- [Project Overview](#-project-overview)
- [Architecture](#-architecture)
- [Technology Stack](#-technology-stack)
- [Project Structure](#-project-structure)
- [Key Features](#-key-features)
- [Application Services](#-application-services)
- [Local Setup](#-local-setup)
- [CI/CD Pipeline](#-cicd-pipeline)
- [Docker Deployment](#-docker-deployment)
- [Kubernetes Deployment](#-kubernetes-deployment)
- [Helm Deployment](#-helm-deployment)
- [Terraform and AWS](#-terraform-and-aws)
- [Monitoring and Observability](#-monitoring-and-observability)
- [Automation Scripts](#-automation-scripts)
- [Testing](#-testing)
- [Security Best Practices](#-security-best-practices)
- [Future Enhancements](#-future-enhancements)
- [Author](#-author)

---

## 🎯 Project Overview

Managing application deployments manually can introduce configuration errors, inconsistent environments, deployment failures, and operational overhead.

This project addresses these challenges by implementing an automated DevOps workflow for a containerized MERN application.

### Objectives

- Containerize frontend and backend services using Docker.
- Automate application validation and image publishing using GitHub Actions.
- Deploy containerized services using Kubernetes.
- Manage Kubernetes resources using Helm.
- Provision cloud infrastructure using Terraform.
- Monitor application performance using Prometheus and Grafana.
- Automate health checks, load testing, and recovery operations.

## 🏗️ Architecture

```text
                 Developer
                     |
                     v
              GitHub Repository
                     |
                     v
              GitHub Actions
                     |
          +----------+----------+
          |                     |
          v                     v
      Backend Tests       Frontend Checks
          |                     |
          +----------+----------+
                     |
                     v
              Docker Build
                     |
                     v
             GitHub Container
                 Registry
                     |
                     v
             Kubernetes Cluster
                     |
              +------+------+
              |             |
              v             v
          Frontend        Backend
          Service         Service
              |             |
              +------+------+
                     |
                     v
                 MongoDB
              (Compose setup)

       Prometheus  <--- Metrics
           |
           v
         Grafana
           |
           v
       Dashboards
       & Alerts

       Terraform
           |
           v
        AWS EC2
```

> **Note:** The Terraform configuration currently provisions an AWS EC2 instance. Kubernetes cluster provisioning and application deployment are separate operations.

## 🛠️ Technology Stack

| Category | Technologies |
|---|---|
| Frontend | React.js, Vite, Nginx |
| Backend | Node.js, Express.js |
| Database | MongoDB |
| Containerization | Docker, Docker Compose |
| CI/CD | GitHub Actions |
| Container Registry | GitHub Container Registry (GHCR) |
| Orchestration | Kubernetes |
| Package Management | Helm |
| Infrastructure as Code | Terraform |
| Cloud | AWS EC2 |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Scripting | Bash, Python |
| Version Control | Git, GitHub |

## 📁 Project Structure

```text
DevOps-Cloud/
│
├── .github/
│   └── workflows/
│       ├── ci.yaml
│       ├── docker-build.yaml
│       └── deploy.yaml
│
├── Backend/
│   ├── Dockerfile
│   ├── package.json
│   └── ...
│
├── Frontend/
│   ├── Dockerfile
│   ├── package.json
│   └── ...
│
├── helm/
│   └── mern-app/
│       ├── templates/
│       ├── Chart.yaml
│       └── values.yaml
│
├── k8s/
│   ├── deployments
│   ├── services
│   └── ...
│
├── monitoring/
│   ├── prometheus.yml
│   ├── alert-rules.yml
│   └── grafana/
│
├── scripts/
│   ├── health-check.sh
│   ├── load-test.sh
│   └── recovery.py
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── ...
│
├── docker-compose.yaml
├── dockerfile
├── deploy.sh
├── .dockerignore
├── .gitignore
└── README.md
```

*The tree above summarizes the main components. Individual filenames may vary with the actual repository contents.*

## ✨ Key Features

### 1. Docker Containerization

- Containerized React frontend and Express backend.
- Production frontend served through unprivileged Nginx.
- Docker Compose for local multi-service orchestration.
- MongoDB, Prometheus, and Grafana integrated into the local stack.

### 2. Automated CI/CD

GitHub Actions automates:

- Backend unit tests.
- Frontend linting and production builds.
- Docker image creation.
- Image publishing to GHCR.
- Kubernetes deployment after successful image builds.

### 3. Kubernetes Orchestration

- Kubernetes Deployments and Services.
- Frontend exposed through NodePort.
- Internal backend service communication.
- Horizontal Pod Autoscaling.
- Health probes and rollout management.

### 4. Helm Charts

- Reusable Kubernetes deployment templates.
- Configurable container image repositories and tags.
- Namespace-based application installation.
- Simplified release management.

### 5. Infrastructure as Code

- AWS EC2 provisioning using Terraform.
- Parameterized infrastructure configuration.
- Terraform initialization, validation, planning, and deployment workflow.

### 6. Monitoring and Observability

- Prometheus metrics collection.
- Grafana dashboard provisioning.
- Application health monitoring.
- Alert rules for operational visibility.

### 7. Automation

- Application health-check scripts.
- Sequential load-testing utility.
- Kubernetes recovery automation.

---

## 🚀 Local Setup

### Prerequisites

Install the following:

- Docker Desktop or Docker Engine
- Docker Compose plugin
- Git
- Node.js 22+
- npm

### Step 1: Clone the repository

```bash
git clone https://github.com/Princekumarsahu-321/DevOps-Cloud.git

cd DevOps-Cloud
```

### Step 2: Start the application

```bash
docker compose -f docker-compose.yaml up --build -d
```

### Step 3: Verify running containers

```bash
docker compose -f docker-compose.yaml ps
```

### Step 4: Access services

| Service | Local URL |
|---|---|
| Frontend | http://localhost:5173 |
| Backend Health | http://localhost:5000/health |
| Prometheus | http://localhost:9090 |
| Grafana | http://localhost:3001 |

**Grafana credentials**

- Username: `admin`
- Password: `change-me-now`

The default password is for local development only. Change it before using a shared environment.

### Step 5: Stop the application

```bash
docker compose -f docker-compose.yaml down
```

To delete persistent MongoDB and Grafana data volumes intentionally:

```bash
docker compose -f docker-compose.yaml down -v
```

---

## ⚙️ CI/CD Pipeline

GitHub Actions provides automated validation, container building, publishing, and deployment workflows.

### Pipeline Workflow

1. Developer pushes code to GitHub.
2. GitHub Actions starts the CI workflow.
3. Backend tests execute.
4. Frontend lint and build checks run.
5. Docker images are built.
6. Images are published to GitHub Container Registry.
7. Kubernetes deployment workflow updates application workloads.

### Container Images

```text
ghcr.io/<owner>/mern-backend
ghcr.io/<owner>/mern-frontend
```

Images are published using commit-specific tags:

```text
sha-<commit>
```

The pipeline also publishes a `latest` tag on pushes to the main branch.

### Required GitHub Configuration

For Kubernetes deployment, configure:

- `KUBE_CONFIG` repository Actions secret.
- Production GitHub Environment.
- Appropriate deployment permissions.
- Cluster connectivity from the GitHub Actions runner.
- GHCR image-pull credentials if packages are private.

---

## 🐳 Docker Deployment

Build the backend:

```bash
docker build -t mern-backend ./Backend
```

Build the frontend:

```bash
docker build -t mern-frontend ./Frontend
```

Run the complete local stack:

```bash
docker compose -f docker-compose.yaml up --build -d
```

Check logs:

```bash
docker compose -f docker-compose.yaml logs -f
```

---

## ☸️ Kubernetes Deployment

### Prerequisites

- Kubernetes cluster.
- kubectl.
- Access to published GHCR images.

### Apply Kubernetes resources

```bash
kubectl apply -f k8s/
```

### Check deployments

```bash
kubectl get deployments
kubectl get pods
kubectl get services
```

### Check rollout status

```bash
kubectl rollout status deployment/<deployment-name>
```

### Verify frontend service

The frontend is exposed through NodePort `30080`.

```bash
kubectl get svc
```

> CPU-based Horizontal Pod Autoscaling requires metrics-server to be installed and working in the cluster.

---

## ⎈ Helm Deployment

Helm simplifies Kubernetes application installation and configuration.

### Install or upgrade the application

```bash
helm upgrade --install mern-app ./helm/mern-app \
  --namespace mern-app \
  --create-namespace \
  --set backend.image.repository=ghcr.io/<owner>/mern-backend \
  --set backend.image.tag=<image-tag> \
  --set frontend.image.repository=ghcr.io/<owner>/mern-frontend \
  --set frontend.image.tag=<image-tag>
```

Replace `<owner>` and `<image-tag>` with your actual GitHub username and published image tag.

### Verify Helm release

```bash
helm list -n mern-app
```

### Uninstall

```bash
helm uninstall mern-app -n mern-app
```

---

## ☁️ Terraform and AWS

Terraform is used to provision AWS EC2 infrastructure.

**Current scope:** EC2 instance provisioning only. The configuration does not create a Kubernetes cluster or deploy the application.

### Prerequisites

- AWS account.
- AWS CLI.
- Terraform.
- Configured AWS credentials.
- Region-compatible AMI ID.

### Initialize Terraform

```bash
cd terraform

terraform init
```

### Validate configuration

```bash
terraform validate
```

### Review infrastructure plan

```bash
terraform plan -var="ami_id=<region-specific-ami>"
```

### Apply configuration

```bash
terraform apply -var="ami_id=<region-specific-ami>"
```

### Destroy infrastructure

```bash
terraform destroy -var="ami_id=<region-specific-ami>"
```

Always review estimated AWS costs before provisioning resources.

---

## 📊 Monitoring and Observability

Prometheus and Grafana provide application monitoring and operational visibility.

### Prometheus

- Collects backend metrics.
- Scrapes configured monitoring targets.
- Evaluates alerting rules.

### Grafana

- Visualizes application metrics.
- Uses provisioned dashboards.
- Displays operational performance data.

### Monitoring endpoints

```text
Backend metrics: /metrics
Backend health:  /health
Liveness:       /health/live
Readiness:      /health/ready
```

Access the monitoring tools:

```text
Prometheus: http://localhost:9090
Grafana:    http://localhost:3001
```

---

## 🔧 Automation Scripts

The repository includes helper scripts for operational tasks.

### Application Health Check

```bash
bash scripts/health-check.sh
```

Checks the health of local Compose services.

### Load Testing

```bash
bash scripts/load-test.sh http://localhost:5000/health 25
```

Sends sequential HTTP requests to the specified endpoint.

The utility supports a maximum of 1,000 requests.

### Kubernetes Recovery

```bash
python scripts/recovery.py backend
```

Runs the backend recovery helper against the selected Kubernetes cluster.

Ensure kubectl is configured and the selected cluster is accessible before running it.

---

## 🧪 Testing

### Backend tests

```bash
cd Backend

npm ci

npm test
```

### Frontend validation

```bash
cd Frontend

npm ci

npm run lint

npm run build
```

### Kubernetes verification

```bash
kubectl get pods -A

kubectl get deployments -A

kubectl get services -A
```

---

## 🔐 Security Best Practices

This project follows several important DevOps security practices:

- Never commit AWS credentials, kubeconfigs, or `.env` files.
- Use least-privilege IAM permissions.
- Review Terraform plans before applying changes.
- Use secure and immutable image tags for production releases.
- Configure GHCR access appropriately.
- Change default Grafana credentials.
- Restrict production deployment permissions.
- Consider container image vulnerability scanning before release.

---

## 🚧 Future Enhancements

Planned improvements to extend the platform:

- [ ] Integrate Trivy container image scanning.
- [ ] Implement AWS OIDC authentication for GitHub Actions.
- [ ] Integrate AWS ECR.
- [ ] Create separate staging and production environments.
- [ ] Implement automated Kubernetes rollback.
- [ ] Add centralized logging with Grafana Loki.
- [ ] Configure Terraform remote state management.
- [ ] Add integration and end-to-end testing.
- [ ] Provision managed Kubernetes infrastructure using Terraform.
- [ ] Introduce deployment approval and release versioning.

---

## 👨‍💻 Author

**Prince Kumar**

B.Tech Computer Science Engineering | Aspiring DevOps & Cloud Engineer

**Technical Interests:**
- DevOps and Cloud Engineering
- Backend Development
- Containerization and Orchestration
- Infrastructure as Code
- CI/CD Automation
- Monitoring and Observability

### Connect with me

- GitHub: https://github.com/Princekumarsahu-321
- LinkedIn: https://linkedin.com/in/prince-kumar-2006-dev/

---

⭐ If you find this project useful, consider giving the repository a star!

**Built with a focus on automation, scalability, reliability, and modern DevOps practices.**
