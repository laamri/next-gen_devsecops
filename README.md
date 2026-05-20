# Next-Gen DevSecOps Platform

> Plateforme intelligente d'automatisation DevSecOps pilotée par l'IA : de la description
> en langage naturel vers la génération, la validation et l'exécution de pipelines CI/CD sécurisés.

![Stack](https://img.shields.io/badge/stack-FastAPI%20%7C%20React%20%7C%20Jenkins-blue)
![Security](https://img.shields.io/badge/security-DevSecOps%20%7C%20Trivy%20%7C%20SonarQube-red)
![AI](https://img.shields.io/badge/AI-Groq%20API-orange)
![IaC](https://img.shields.io/badge/IaC-Terraform%20%7C%20AWS-yellow)
![Monitoring](https://img.shields.io/badge/monitoring-Prometheus%20%7C%20Grafana-green)

---

## Table des matières

- [Vue d'ensemble](#vue-densemble)
- [Architecture](#architecture)
- [Fonctionnalités principales](#fonctionnalités-principales)
- [Structure du projet](#structure-du-projet)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Variables d'environnement](#variables-denvironnement)
- [Utilisation](#utilisation)
- [Sécurité](#sécurité)
- [Tests](#tests)
- [Nettoyage local](#nettoyage-local)
- [Bonnes pratiques Git](#bonnes-pratiques-git)
- [Contribuer](#contribuer)
- [Auteurs](#auteurs)

---

## Vue d'ensemble

**Next-Gen DevSecOps** est une plateforme web qui automatise la création de pipelines DevSecOps
à partir d'une simple description en langage naturel.

L'utilisateur décrit le besoin technique depuis une interface React. Le backend FastAPI reçoit
la requête, vérifie l'authentification, applique les règles de sécurité, interagit avec un moteur
d'intelligence artificielle et génère des artefacts DevSecOps prêts à l'emploi.

La plateforme permet de générer automatiquement :

- un **Jenkinsfile** pour l'orchestration CI/CD ;
- un **Dockerfile** pour la conteneurisation ;
- des fichiers **Terraform** pour l'Infrastructure as Code ;
- des fichiers de configuration liés au déploiement ;
- des rapports de validation et de sécurité.

Les artefacts générés sont ensuite validés, organisés, puis envoyés automatiquement vers GitHub.
Jenkins peut ensuite détecter les changements, exécuter le pipeline, lancer les contrôles de sécurité
et produire un rapport d'exécution.

L'objectif du projet est de combiner l'intelligence artificielle, l'automatisation DevOps,
la sécurité continue, l'Infrastructure as Code, le cloud et le monitoring dans une solution unique.

---

## Architecture

```text
Utilisateur
   |
   | Description du besoin en langage naturel
   v
[Frontend React / Vite]
   |
   | Requête HTTP vers l'API
   v
[Backend FastAPI]
   |
   | Authentification JWT
   | Contrôle d'accès
   | Validation de la demande
   v
[Moteur IA - Groq API]
   |
   | Génération des artefacts DevSecOps
   v
[Validation Backend]
   |
   | Vérification du contenu généré
   | Normalisation des fichiers
   | Contrôle des sorties
   v
[GitHub]
   |
   | Push automatique des artefacts
   v
[Jenkins]
   |
   | Pipeline CI/CD
   | Analyse SonarQube
   | Scan Trivy
   | Build Docker
   | Terraform plan
   v
[AWS / Infrastructure]
   |
   | Préparation ou validation de l'environnement cloud
   v
[Monitoring]
   |
   | Prometheus
   | Grafana
   v
[Interface utilisateur]
   |
   | Historique
   | Statut
   | Rapport
   | Résultats de sécurité
```

---

## Fonctionnalités principales

La plateforme propose plusieurs fonctionnalités autour de l'automatisation DevSecOps :

- génération automatique d'artefacts CI/CD à partir d'un prompt ;
- backend FastAPI structuré et sécurisé ;
- frontend React moderne avec plusieurs pages fonctionnelles ;
- authentification utilisateur ;
- intégration avec GitHub ;
- génération de Jenkinsfile ;
- génération de Dockerfile ;
- génération de configurations Terraform ;
- analyse de sécurité avec Trivy ;
- analyse statique avec SonarQube ;
- suivi des pipelines ;
- monitoring avec Prometheus ;
- visualisation possible avec Grafana ;
- tests unitaires backend ;
- séparation claire entre backend, frontend, monitoring, Jenkins, Terraform et tests.

---

## Structure du projet

```text
Next-Gen-DevSecOps/
│
├── backend/                         # Backend principal de la plateforme
│   ├── api/                         # Routes API FastAPI
│   ├── security/                    # Modules liés à la sécurité
│   ├── services/                    # Services métier
│   ├── utils/                       # Fonctions utilitaires
│   └── main.py                      # Point d'entrée du backend FastAPI
│
├── frontend/                        # Interface utilisateur React / Vite
│   ├── src/
│   │   ├── components/              # Composants réutilisables
│   │   │   └── Navbar.tsx
│   │   │
│   │   ├── hooks/                   # Hooks personnalisés
│   │   │   └── useAuth.ts
│   │   │
│   │   ├── lib/                     # Fonctions communes et configuration API
│   │   │   ├── api.ts
│   │   │   └── utils.ts
│   │   │
│   │   ├── pages/                   # Pages principales
│   │   │   ├── DashboardPage.tsx
│   │   │   ├── EditorPage.tsx
│   │   │   ├── GeneratorPage.tsx
│   │   │   ├── HistoryPage.tsx
│   │   │   ├── LoginPage.tsx
│   │   │   ├── MonitoringPage.tsx
│   │   │   └── SettingsPage.tsx
│   │   │
│   │   ├── App.tsx                  # Composant principal
│   │   ├── main.tsx                 # Point d'entrée React
│   │   └── styles.css               # Styles globaux
│   │
│   ├── package.json                 # Dépendances frontend
│   └── vite.config.ts               # Configuration Vite
│
├── jenkins/
│   └── templates/                   # Templates Jenkins utilisés par la génération
│
├── monitoring/
│   └── prometheus.yml               # Configuration Prometheus
│
├── terraform/                       # Infrastructure as Code
│   ├── main.tf                      # Configuration principale Terraform
│   ├── environments/
│   │   ├── staging/                 # Environnement staging
│   │   └── prod/                    # Environnement production
│   ├── guardrails/                  # Règles de contrôle IaC
│   └── modules/
│       ├── ec2/                     # Module EC2
│       ├── networking/              # Module réseau
│       └── security/                # Module sécurité
│
├── tests/
│   ├── backend/                     # Tests unitaires backend
│   │   ├── test_artifact_generator.py
│   │   ├── test_auth.py
│   │   ├── test_github_pusher.py
│   │   ├── test_groq_client.py
│   │   ├── test_output_validator.py
│   │   ├── test_pipeline_generator.py
│   │   ├── test_prompt_guard.py
│   │   └── test_threat_analyzer.py
│   │
│   ├── frontend/                    # Tests frontend
│   └── integration/                 # Tests d'intégration
│
├── docs/                           # Documentation du projet
├── .github/                        # Workflows GitHub
├── .env.example                    # Exemple de variables d'environnement
├── .gitignore                      # Fichiers ignorés par Git
├── CONTRIBUTING.md                 # Guide de contribution
├── docker-compose.yml              # Services Docker locaux
└── README.md                       # Documentation principale
```

---

## Prérequis

Avant de lancer le projet, les outils suivants doivent être installés :

- Python 3.10 ou supérieur ;
- Node.js 18 ou supérieur ;
- npm ;
- Git ;
- Docker ;
- Docker Compose ;
- Terraform ;
- Jenkins ;
- SonarQube ;
- Trivy ;
- un compte GitHub ;
- un compte AWS ;
- une clé API Groq.

---

## Installation

### 1. Cloner le projet

```bash
git clone https://github.com/oussama-bagy/Next-Gen-DevSecOps.git
cd Next-Gen-DevSecOps
```

### 2. Préparer le fichier d'environnement

```bash
cp .env.example .env
```

Ensuite, modifier le fichier `.env` avec les vraies valeurs locales.

> Important : le fichier `.env` contient des secrets. Il ne doit jamais être envoyé sur GitHub.

---

### 3. Installer le backend

```bash
cd backend
pip install -r requirements.txt
```

### 4. Lancer le backend

```bash
uvicorn main:app --reload --port 8000
```

Le backend est disponible sur :

```text
http://localhost:8000
```

La documentation Swagger est disponible sur :

```text
http://localhost:8000/docs
```

---

### 5. Installer le frontend

Dans un autre terminal :

```bash
cd frontend
npm install
```

### 6. Lancer le frontend

```bash
npm run dev
```

L'interface web est disponible sur :

```text
http://localhost:5173
```

---

### 7. Lancer la stack locale avec Docker Compose

Depuis la racine du projet :

```bash
docker-compose up -d
```

Cette commande permet de lancer les services définis dans le fichier `docker-compose.yml`.

---

## Variables d'environnement

Les variables sensibles doivent être placées dans le fichier `.env`.

| Variable | Description |
|---------|-------------|
| `GROQ_API_KEY` | Clé API utilisée pour communiquer avec le modèle IA |
| `JWT_SECRET_KEY` | Clé secrète utilisée pour signer les tokens JWT |
| `GITHUB_TOKEN` | Token GitHub utilisé pour pousser les artefacts générés |
| `GITHUB_REPO` | Dépôt GitHub cible |
| `AWS_ACCESS_KEY_ID` | Identifiant d'accès AWS |
| `AWS_SECRET_ACCESS_KEY` | Clé secrète AWS |
| `AWS_REGION` | Région AWS utilisée |
| `SONAR_TOKEN` | Token SonarQube |
| `PROMETHEUS_PORT` | Port Prometheus |

Exemple :

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

> Le fichier `.env.example` peut être versionné.
> Le fichier `.env` réel doit rester uniquement en local.

---

## Utilisation

### 1. Accéder à l'application

Après avoir lancé le frontend, ouvrir :

```text
http://localhost:5173
```

---

### 2. Se connecter

L'utilisateur accède à la plateforme via la page de connexion.

Le backend vérifie l'authentification et protège les routes sensibles à l'aide d'un mécanisme
basé sur les tokens JWT.

---

### 3. Générer un pipeline DevSecOps

Depuis la page de génération, l'utilisateur saisit une demande en langage naturel.

Exemple :

```text
Créer un pipeline DevSecOps pour une application Node.js conteneurisée avec Docker,
analyse SonarQube, scan Trivy et préparation d'une infrastructure AWS avec Terraform.
```

La plateforme génère ensuite les artefacts nécessaires.

---

### 4. Vérifier les artefacts générés

Les fichiers générés peuvent inclure :

- `Jenkinsfile`
- `Dockerfile`
- fichiers Terraform
- fichiers de configuration
- rapport de validation
- rapport de sécurité

---

### 5. Publication sur GitHub

Après génération et validation, les fichiers sont envoyés automatiquement vers GitHub.

Le projet peut créer une branche dédiée pour chaque génération afin de garder un historique
propre des pipelines produits.

---

### 6. Exécution Jenkins

Jenkins détecte les changements et exécute le pipeline.

Le pipeline peut contenir les étapes suivantes :

- récupération du code ;
- validation des artefacts ;
- analyse statique avec SonarQube ;
- build Docker ;
- scan de vulnérabilités avec Trivy ;
- exécution de `terraform plan` ;
- archivage des résultats ;
- génération du rapport final.

---

### 7. Consultation des résultats

Depuis l'interface utilisateur, il est possible de consulter :

- l'historique des générations ;
- le statut du pipeline ;
- les résultats de sécurité ;
- les logs principaux ;
- les rapports générés ;
- les informations de monitoring.

---

## Sécurité

La plateforme applique plusieurs mécanismes de sécurité afin de réduire les risques liés
à l'utilisation de l'IA, aux secrets, aux artefacts générés et à l'automatisation CI/CD.

| Mécanisme | Description |
|----------|-------------|
| Validation des entrées | Vérifie les prompts utilisateur avant traitement |
| Protection contre les prompts dangereux | Réduit les risques d'instructions malveillantes |
| Authentification JWT | Protège l'accès à l'API |
| Contrôle d'accès | Limite les actions selon le rôle de l'utilisateur |
| Validation des artefacts | Vérifie les fichiers générés avant publication |
| GitHub Token | Permet le push automatique sans exposer les identifiants |
| Jenkins Credentials | Protège les secrets utilisés dans les pipelines |
| SonarQube | Analyse statique du code |
| Trivy | Scan de vulnérabilités des images Docker |
| Terraform plan | Vérifie l'infrastructure avant application |
| Prometheus | Collecte les métriques techniques |
| Grafana | Visualise l'état de la plateforme |

---

## Tests

### Tests backend

Depuis la racine du projet :

```bash
pytest tests/backend -v
```

---

### Tests backend avec couverture

```bash
pytest tests/backend --cov=backend --cov-report=html
```

---

### Tests frontend

```bash
cd frontend
npm test
```

---

### Vérification Git

```bash
git status --short
```

---

### Vérifier les fichiers ignorés

```bash
git check-ignore -v .env
git check-ignore -v frontend/node_modules
git check-ignore -v terraform/.terraform
git check-ignore -v terraform/terraform.tfstate
```

---

## Nettoyage local

Certains fichiers ne doivent pas être versionnés car ils sont générés automatiquement,
volumineux ou propres à la machine locale.

Fichiers et dossiers généralement à ne pas pousser :

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

Pour nettoyer les fichiers ignorés localement tout en gardant `.env` et `start.ps1` :

```bash
git clean -fdX -e .env -e start.ps1
```

Explication :

- `git clean` supprime les fichiers non suivis ;
- `-f` force la suppression ;
- `-d` inclut les dossiers ;
- `-X` supprime seulement les fichiers ignorés par `.gitignore` ;
- `-e .env` conserve le fichier `.env` ;
- `-e start.ps1` conserve le script local `start.ps1`.

---

## Bonnes pratiques Git

Avant chaque commit, vérifier l'état du projet :

```bash
git status --short
```

Ajouter uniquement les fichiers utiles :

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

Créer un commit clair :

```bash
git commit -m "docs: update final project README"
```

Pousser vers GitHub :

```bash
git push origin main
```

Ne jamais pousser :

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

## Contribuer

Les contributions doivent respecter une organisation claire du code, des commits lisibles
et une séparation entre les fonctionnalités backend, frontend, sécurité, infrastructure
et monitoring.

Pour plus de détails, consulter le fichier :

```text
CONTRIBUTING.md
```

---

## Auteurs

Projet Fin de Semestre — ENSA Marrakech 2026

- Bagy Oussama
- Sayf Eddine Laamri

Filière : Cybersécurité & Télécommunications

---

## Conclusion

Next-Gen DevSecOps démontre qu'il est possible de combiner l'intelligence artificielle,
l'automatisation CI/CD, la sécurité continue, l'Infrastructure as Code, le cloud computing
et le monitoring dans une seule plateforme moderne.

Le projet constitue une base solide pour évoluer vers des fonctionnalités plus avancées,
comme l'auto-correction des erreurs, l'estimation des coûts cloud, le déploiement complet
vers AWS, l'amélioration du monitoring et le support multi-cloud.
