# Next-Gen DevSecOps Platform

> Intelligent AI-driven DevSecOps automation platform: from natural language description
> to the generation, validation, and execution of secure CI/CD pipelines.

![Stack](https://img.shields.io/badge/stack-FastAPI%20%7C%20React%20%7C%20Jenkins-blue)
![Security](https://img.shields.io/badge/security-DevSecOps%20%7C%20Trivy%20%7C%20SonarQube-red)
![AI](https://img.shields.io/badge/AI-Groq%20API-orange)
![IaC](https://img.shields.io/badge/IaC-Terraform%20%7C%20AWS-yellow)
![Monitoring](https://img.shields.io/badge/monitoring-Prometheus%20%7C%20Grafana-green)

---

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Key Features](#key-features)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Environment Variables](#environment-variables)
- [Usage](#usage)
- [Security](#security)
- [Tests](#tests)
- [Local Cleanup](#local-cleanup)
- [Git Best Practices](#git-best-practices)
- [Contributing](#contributing)
- [Authors](#authors)

---

## Overview

**Next-Gen DevSecOps** is a web platform that automates the creation of DevSecOps pipelines
from a simple natural language description.

The user describes the technical requirement through a React interface. The FastAPI backend
receives the request, verifies authentication, applies security rules, interacts with an
artificial intelligence engine, and generates ready-to-use DevSecOps artifacts.

The platform can automatically generate:

- a **Jenkinsfile** for CI/CD orchestration;
- a **Dockerfile** for containerization;
- **Terraform** files for Infrastructure as Code;
- deployment-related configuration files;
- validation and security reports.

The generated artifacts are then validated, organized, and automatically pushed to GitHub.
Jenkins can then detect the changes, run the pipeline, perform security checks, and produce
an execution report.

The goal of the project is to combine artificial intelligence, DevOps automation, continuous
security, Infrastructure as Code, cloud, and monitoring into a single solution.

---

## Architecture

```text
User
   |
   | Natural language description of the requirement
   v
[React / Vite Frontend]
   |
   | HTTP request to the API
   v
[FastAPI Backend]
   |
   | JWT Authentication
   | Access control
   | Request validation
   v
[AI Engine - Groq API]
   |
   | Generation of DevSecOps artifacts
   v
[Backend Validation]
   |
   | Verification of generated content
   | File normalization
   | Output control
   v
[GitHub]
   |
   | Automatic push of artifacts
   v
[Jenkins]
   |
   | CI/CD pipeline
   | SonarQube analysis
   | Trivy scan
   | Docker build
   | Terraform plan
   v
[AWS / Infrastructure]
   |
   | Cloud environment preparation or validation
   v
[Monitoring]
   |
   | Prometheus
   | Grafana
   v
[User Interface]
   |
   | History
   | Status
   | Report
   | Security results
```

---

## Key Features

The platform offers several features around DevSecOps automation:

- automatic generation of CI/CD artifacts from a prompt;
- structured and secure FastAPI backend;
- modern React frontend with multiple functional pages;
- user authentication;
- GitHub integration;
- Jenkinsfile generation;
- Dockerfile generation;
- Terraform configuration generation;
- security analysis with Trivy;
- static analysis with SonarQube;
- pipeline tracking;
- monitoring with Prometheus;
- possible visualization with Grafana;
- backend unit tests;
- clear separation between backend, frontend, monitoring, Jenkins, Terraform, and tests.

---

## Project Structure

```text
Next-Gen-DevSecOps/
│
├── backend/                         # Main platform backend
│   ├── api/                         # FastAPI API routes
│   ├── security/                    # Security-related modules
│   ├── services/                    # Business logic services
│   ├── utils/                       # Utility functions
│   └── main.py                      # FastAPI backend entry point
│
├── frontend/                        # React / Vite user interface
│   ├── src/
│   │   ├── components/              # Reusable components
│   │   │   └── Navbar.tsx
│   │   │
│   │   ├── hooks/                   # Custom hooks
│   │   │   └── useAuth.ts
│   │   │
│   │   ├── lib/                     # Common functions and API configuration
│   │   │   ├── api.ts
│   │   │   └── utils.ts
│   │   │
│   │   ├── pages/                   # Main pages
│   │   │   ├── DashboardPage.tsx
│   │   │   ├── EditorPage.tsx
│   │   │   ├── GeneratorPage.tsx
│   │   │   ├── HistoryPage.tsx
│   │   │   ├── LoginPage.tsx
│   │   │   ├── MonitoringPage.tsx
│   │   │   └── SettingsPage.tsx
│   │   │
│   │   ├── App.tsx                  # Main component
│   │   ├── main.tsx                 # React entry point
│   │   └── styles.css               # Global styles
│   │
│   ├── package.json                 # Frontend dependencies
│   └── vite.config.ts               # Vite configuration
│
├── jenkins/
│   └── templates/                   # Jenkins templates used for generation
│
├── monitoring/
│   └── prometheus.yml               # Prometheus configuration
│
├── terraform/                       # Infrastructure as Code
│   ├── main.tf                      # Main Terraform configuration
│   ├── environments/
│   │   ├── staging/                 # Staging environment
│   │   └── prod/                    # Production environment
│   ├── guardrails/                  # IaC control rules
│   └── modules/
│       ├── ec2/                     # EC2 module
│       ├── networking/              # Network module
│       └── security/                # Security module
│
├── tests/
│   ├── backend/                     # Backend unit tests
│   │   ├── test_artifact_generator.py
│   │   ├── test_auth.py
│   │   ├── test_github_pusher.py
│   │   ├── test_groq_client.py
│   │   ├── test_output_validator.py
│   │   ├── test_pipeline_generator.py
│   │   ├── test_prompt_guard.py
│   │   └── test_threat_analyzer.py
│   │
│   ├── frontend/                    # Frontend tests
│   └── integration/                 # Integration tests
│
├── docs/                           # Project documentation
├── .github/                        # GitHub workflows
├── .env.example                    # Example environment variables
├── .gitignore                      # Files ignored by Git
├── CONTRIBUTING.md                 # Contribution guide
├── docker-compose.yml              # Local Docker services
└── README.md                       # Main documentation
```

---

## Prerequisites

Before running the project, the following tools must be installed:

- Python 3.10 or higher;
- Node.js 18 or higher;
- npm;
- Git;
- Docker;
- Docker Compose;
- Terraform;
- Jenkins;
- SonarQube;
- Trivy;
- a GitHub account;
- an AWS account;
- a Groq API key.

---

## Installation

### 1. Clone the project

```bash
git clone https://github.com/oussama-bagy/Next-Gen-DevSecOps.git
cd Next-Gen-DevSecOps
```

### 2. Set up the environment file

```bash
cp .env.example .env
```

Then edit the `.env` file with the real local values.

> Important: the `.env` file contains secrets. It must never be pushed to GitHub.

---

### 3. Install the backend

```bash
cd backend
pip install -r requirements.txt
```

### 4. Run the backend

```bash
uvicorn main:app --reload --port 8000
```

The backend is available at:

```text
http://localhost:8000
```

The Swagger documentation is available at:

```text
http://localhost:8000/docs
```

---

### 5. Install the frontend

In another terminal:

```bash
cd frontend
npm install
```

### 6. Run the frontend

```bash
npm run dev
```

The web interface is available at:

```text
http://localhost:5173
```

---

### 7. Run the full local stack with Docker Compose

From the project root:

```bash
docker-compose up -d
```

This command launches the services defined in the `docker-compose.yml` file.

---

## Environment Variables

Sensitive variables must be placed in the `.env` file.

| Variable | Description |
|---------|-------------|
| `GROQ_API_KEY` | API key used to communicate with the AI model |
| `JWT_SECRET_KEY` | Secret key used to sign JWT tokens |
| `GITHUB_TOKEN` | GitHub token used to push generated artifacts |
| `GITHUB_REPO` | Target GitHub repository |
| `AWS_ACCESS_KEY_ID` | AWS access key ID |
| `AWS_SECRET_ACCESS_KEY` | AWS secret access key |
| `AWS_REGION` | AWS region used |
| `SONAR_TOKEN` | SonarQube token |
| `PROMETHEUS_PORT` | Prometheus port |

Example:

```env
GROQ_API_KEY=your_groq_api_key
JWT_SECRET_KEY=your_jwt_secret
GITHUB_TOKEN=your_github_token
GITHUB_REPO=username/generated-pipelines
AWS_ACCESS_KEY_ID=your_aws_access_key
AWS_SECRET_ACCESS_KEY=your_aws_secret_key
AWS_REGION=eu-west-3
SONAR_TOKEN=your_sonar_token
PROMETHEUS_PORT=9090
```

> The `.env.example` file can be versioned.
> The actual `.env` file must remain local only.

---

## Usage

### 1. Access the application

After starting the frontend, open:

```text
http://localhost:5173
```

---

### 2. Log in

The user accesses the platform through the login page.

The backend verifies authentication and protects sensitive routes using a JWT
token-based mechanism.

---

### 3. Generate a DevSecOps pipeline

From the generation page, the user enters a request in natural language.

Example:

```text
Create a DevSecOps pipeline for a containerized Node.js application with Docker,
SonarQube analysis, Trivy scan, and AWS infrastructure preparation with Terraform.
```

The platform then generates the required artifacts.

---

### 4. Review the generated artifacts

The generated files can include:

- `Jenkinsfile`
- `Dockerfile`
- Terraform files
- configuration files
- validation report
- security report

---

### 5. Publishing to GitHub

After generation and validation, the files are automatically pushed to GitHub.

The project can create a dedicated branch for each generation to keep a clean
history of the produced pipelines.

---

### 6. Jenkins Execution

Jenkins detects the changes and runs the pipeline.

The pipeline can include the following steps:

- code checkout;
- artifact validation;
- static analysis with SonarQube;
- Docker build;
- vulnerability scanning with Trivy;
- execution of `terraform plan`;
- archiving of results;
- generation of the final report.

---

### 7. Reviewing results

From the user interface, it is possible to view:

- the generation history;
- the pipeline status;
- the security results;
- the main logs;
- the generated reports;
- the monitoring information.

---

## Security

The platform applies several security mechanisms to reduce risks related to AI usage,
secrets, generated artifacts, and CI/CD automation.

| Mechanism | Description |
|----------|-------------|
| Input validation | Verifies user prompts before processing |
| Protection against dangerous prompts | Reduces the risk of malicious instructions |
| JWT Authentication | Protects API access |
| Access control | Limits actions based on the user's role |
| Artifact validation | Verifies generated files before publication |
| GitHub Token | Enables automatic push without exposing credentials |
| Jenkins Credentials | Protects secrets used in the pipelines |
| SonarQube | Static code analysis |
| Trivy | Docker image vulnerability scanning |
| Terraform plan | Verifies infrastructure before applying |
| Prometheus | Collects technical metrics |
| Grafana | Visualizes the platform's status |

---

## Tests

### Backend tests

From the project root:

```bash
pytest tests/backend -v
```

---

### Backend tests with coverage

```bash
pytest tests/backend --cov=backend --cov-report=html
```

---

### Frontend tests

```bash
cd frontend
npm test
```

---

### Git verification

```bash
git status --short
```

---

### Check ignored files

```bash
git check-ignore -v .env
git check-ignore -v frontend/node_modules
git check-ignore -v terraform/.terraform
git check-ignore -v terraform/terraform.tfstate
```

---

## Local Cleanup

Some files should not be versioned because they are automatically generated,
large in size, or specific to the local machine.

Files and folders that generally should not be pushed:

```text
.env
.pytest_cache/
__pycache__/
frontend/node_modules/
frontend/dist/
frontend/.vite/
terraform/.terraform/
terraform/terraform.tfstate
terraform/terraform.tfstate.backup
```

To clean up locally ignored files while keeping `.env` and `start.ps1`:

```bash
git clean -fdX -e .env -e start.ps1
```

Explanation:

- `git clean` removes untracked files;
- `-f` forces the removal;
- `-d` includes directories;
- `-X` removes only files ignored by `.gitignore`;
- `-e .env` keeps the `.env` file;
- `-e start.ps1` keeps the local `start.ps1` script.

---

## Git Best Practices

Before each commit, check the project status:

```bash
git status --short
```

Add only the useful files:

```bash
git add README.md
git add .gitignore
git add backend/
git add frontend/src/
git add jenkins/
git add monitoring/
git add terraform/
git add tests/
```

Create a clear commit:

```bash
git commit -m "docs: update final project README"
```

Push to GitHub:

```bash
git push origin main
```

Never push:

```text
.env
node_modules/
dist/
.vite/
.terraform/
terraform.tfstate
terraform.tfstate.backup
__pycache__/
.pytest_cache/
```

---

## Contributing

Contributions must follow a clear code organization, readable commits, and a
separation between backend, frontend, security, infrastructure, and monitoring
functionalities.

For more details, refer to the file:

```text
CONTRIBUTING.md
```

---

## Authors

End-of-Semester Project — ENSA Marrakech 2026

- Bagy Oussama
- Sayf Eddine Laamri

Program: Cybersecurity & Telecommunications

---

## Conclusion

Next-Gen DevSecOps demonstrates that it is possible to combine artificial intelligence,
CI/CD automation, continuous security, Infrastructure as Code, cloud computing, and
monitoring into a single modern platform.

The project provides a solid foundation for evolving toward more advanced features,
such as automatic error correction, cloud cost estimation, full deployment to AWS,
improved monitoring, and multi-cloud support.
