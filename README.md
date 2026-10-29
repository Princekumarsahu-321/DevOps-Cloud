# MERN Stack DevOps Automation Platform

A DevOps-focused MERN stack project designed to automate application development, containerization, deployment, infrastructure provisioning, and monitoring using modern DevOps tools.

## Overview

This project aims to build an end-to-end deployment workflow for a MERN (MongoDB, Express.js, React.js, Node.js) application. It combines containerization, CI/CD automation, Kubernetes orchestration, and Infrastructure as Code (IaC) to create a scalable and maintainable deployment environment.

## Project Objectives

- Containerize the application using Docker.
- Automate build and validation workflows using GitHub Actions.
- Deploy application components using Kubernetes.
- Provision infrastructure using Terraform.
- Follow DevOps best practices for configuration management and deployment.
- Improve application reliability, scalability, and observability.

## Technology Stack

| Category | Technologies |
|---|---|
| Frontend | React.js |
| Backend | Node.js, Express.js |
| Database | MongoDB |
| Version Control | Git, GitHub |
| Containerization | Docker |
| CI/CD | GitHub Actions |
| Container Orchestration | Kubernetes |
| Infrastructure as Code | Terraform |
| Cloud Platform | AWS (planned) |
| Monitoring | Prometheus, Grafana (planned) |

## Project Structure

```text
MERN/
├── .github/
│   └── workflows/
│       └── ci.yaml
├── Backend/
├── Frontend/
├── k8s/
├── terraform/
├── .dockerignore
├── .gitignore
├── dockerfile
└── README.md
```

> Note: Add the application source code and configuration files to their respective directories as the project develops.

## Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions CI/CD
    |
    v
Build and Validate Application
    |
    v
Docker Image
    |
    v
Container Registry
    |
    v
Kubernetes Deployment
    |
    v
MERN Application
    |
    v
Monitoring and Logging
```

Infrastructure provisioning can be managed through Terraform, with AWS as the planned cloud platform.

## Getting Started

### Prerequisites

Install the following tools before setting up the project:

- Git
- Node.js and npm
- Docker Desktop
- kubectl
- Kubernetes cluster (Minikube or another supported cluster)
- Terraform
- AWS CLI (if using AWS infrastructure)

### 1. Clone the Repository

```bash
git clone https://github.com/Princekumarsahu-321/DevOps-Cloud.git
cd DevOps-Cloud
```

### 2. Configure the Application

Add the frontend and backend source code to the `Frontend/` and `Backend/` directories.

Configure environment variables locally as required. Do not commit `.env` files, passwords, access tokens, or cloud credentials.

### 3. Build the Docker Image

After configuring the Dockerfile and application source code, build the image:

```bash
docker build -t mern-devops-app -f dockerfile .
```

Run the image only after the Dockerfile and application configuration are ready.

### 4. Validate the CI Workflow

The GitHub Actions workflow is located at:

```text
.github/workflows/ci.yaml
```

Configure the workflow to install dependencies, run available tests, and validate the Docker build. Verify its execution in the repository's **Actions** tab.

### 5. Deploy with Kubernetes

Store Kubernetes manifests in the `k8s/` directory. Once valid manifests and a suitable cluster are available, apply them using:

```bash
kubectl apply -f k8s/
kubectl get pods
kubectl get services
```

### 6. Provision Infrastructure with Terraform

Store Terraform configuration files in `terraform/`. Review the planned changes before applying them:

```bash
cd terraform
terraform init
terraform validate
terraform plan
```

Run `terraform apply` only after reviewing the plan and confirming the expected resources and costs.

## CI/CD Workflow

The intended pipeline includes:

1. Code changes pushed to GitHub.
2. Automated workflow triggered by GitHub Actions.
3. Dependency installation and application checks.
4. Docker image build and validation.
5. Image publication to a container registry.
6. Deployment to Kubernetes.
7. Deployment verification and rollback strategy.

The exact automation depends on the workflow and deployment configuration implemented in the repository.

## Future Enhancements

- [ ] Complete the MERN frontend and backend.
- [ ] Add application tests and health checks.
- [ ] Implement Docker Compose for local development.
- [ ] Complete the GitHub Actions CI/CD pipeline.
- [ ] Publish versioned images to Amazon ECR.
- [ ] Deploy the application using Kubernetes and Helm.
- [ ] Provision AWS infrastructure using Terraform.
- [ ] Add Prometheus and Grafana monitoring.
- [ ] Implement centralized logging and alerting.
- [ ] Configure staging and production environments.
- [ ] Add automated rollback and deployment health checks.
- [ ] Integrate image security scanning.

## Security Best Practices

- Never commit secrets, API keys, or AWS credentials.
- Use environment variables for local configuration.
- Store CI/CD secrets in GitHub Actions Secrets.
- Apply least-privilege permissions to cloud resources.
- Scan container images for known vulnerabilities.
- Review Terraform plans before provisioning infrastructure.

## Learning Outcomes

This project is intended to demonstrate practical skills in:

- MERN stack application development.
- Git and GitHub workflows.
- Docker containerization.
- CI/CD pipeline automation.
- Kubernetes deployments and services.
- Terraform-based infrastructure provisioning.
- Cloud deployment concepts.
- Monitoring, logging, and troubleshooting.

## Author

**Prince Kumar**

- GitHub: [Princekumarsahu-321](https://github.com/Princekumarsahu-321)
- LinkedIn: [Prince Kumar](https://www.linkedin.com/in/prince-kumar-36a88035b/)

## License

This project is available for educational and portfolio purposes. Add a `LICENSE` file if you intend to distribute it under a specific open-source license.

---

*Built as a hands-on learning project to explore full-stack development and modern DevOps automation.*
