# Next-Gen DevSecOps Platform

> Plateforme intelligente d'automatisation DevSecOps pilotée par l'IA : de la description
> en langage naturel à la génération, la validation et le suivi de pipelines CI/CD sécurisés.

![Stack](https://img.shields.io/badge/stack-FastAPI%20%7C%20React%20%7C%20Jenkins-blue)
![Security](https://img.shields.io/badge/security-DevSecOps%20%7C%20Trivy%20%7C%20SonarQube-red)
![AI](https://img.shields.io/badge/AI-Groq%20API-orange)
![IaC](https://img.shields.io/badge/IaC-Terraform%20%7C%20AWS-yellow)
![Monitoring](https://img.shields.io/badge/monitoring-Prometheus%20%7C%20Grafana-green)

---

## Table des matières

- [Vue d'ensemble](#vue-densemble)
- [Architecture](#architecture)
- [Structure du projet](#structure-du-projet)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Variables d'environnement](#variables-denvironnement)
- [Utilisation](#utilisation)
- [Sécurité](#sécurité)
- [Tests](#tests)
- [Contribuer](#contribuer)

---

## Vue d'ensemble

Next-Gen DevSecOps est une plateforme intelligente qui vise à simplifier la mise en place
d'une chaîne DevSecOps moderne. L'utilisateur décrit son besoin en langage naturel depuis
une interface web, puis la plateforme génère automatiquement des artefacts techniques
exploitables dans un environnement CI/CD.

La solution permet notamment de générer :

- Un **Jenkinsfile** pour l'orchestration du pipeline CI/CD
- Un **Dockerfile** pour la conteneurisation de l'application
- Des fichiers **Terraform** pour préparer l'infrastructure cloud
- Des manifestes **Kubernetes** pour le déploiement applicatif
- Un rapport de validation et de sécurité consultable depuis l'interface

Les artefacts générés sont validés, normalisés, puis poussés automatiquement vers un dépôt
GitHub dédié. Jenkins, configuré en pipeline multibranche, détecte ensuite les nouvelles
branches, exécute les étapes de validation et archive les résultats.

L'objectif du projet est de combiner l'intelligence artificielle, le CI/CD, la sécurité,
l'Infrastructure as Code, la conteneurisation, le cloud computing et le monitoring dans
une plateforme cohérente et automatisée.

---

## Architecture

```text
Utilisateur
   |
   | Description en langage naturel
   v
[Frontend React]
   |
   | Requête HTTP sécurisée
   v
[Backend FastAPI]
   |
   | Authentification JWT
   | Contrôle d'accès RBAC
   | Validation du prompt utilisateur
   v
[Moteur IA - Groq API]
   |
   | Génération structurée des artefacts
   v
[Validation Backend]
   |
   | Normalisation des fichiers
   | Validation Jenkinsfile / Dockerfile / Terraform / Kubernetes
   | Templates de secours si génération incomplète
   v
[GitHub Repository]
   |
   | Push automatique sur une branche générée
   v
[Jenkins Multibranch Pipeline]
   |
   | Lecture du Jenkinsfile
   | Validation des artefacts
   | Analyse statique SonarQube
   | Build Docker
   | Scan Trivy
   | Terraform plan
   v
[AWS - Préparation Infrastructure]
   |
   | Vérification de la configuration cloud
   | Utilisation de credentials sécurisés
   v
[Monitoring & Reporting]
   |
   | Prometheus
   | Grafana
   | Rapport final envoyé au backend
   v
[Interface utilisateur]
   |
   | Statut du build
   | Résultats SonarQube
   | Résultats Trivy
   | Niveau de risque
   | Rapport téléchargeable
Structure du projet
Next-Gen-DevSecOps/
│
├── backend/                         # Backend principal de la plateforme
│   ├── api/                         # Routes API FastAPI
│   ├── security/                    # Modules de sécurité
│   ├── services/                    # Services métier
│   ├── utils/                       # Fonctions utilitaires
│   └── main.py                      # Point d'entrée du backend FastAPI
│
├── frontend/                        # Interface utilisateur React
│   ├── src/
│   │   ├── components/              # Composants réutilisables
│   │   ├── hooks/                   # Hooks React personnalisés
│   │   ├── lib/                     # Configuration API et fonctions communes
│   │   ├── pages/                   # Pages principales de l'application
│   │   │   ├── DashboardPage.tsx
│   │   │   ├── EditorPage.tsx
│   │   │   ├── GeneratorPage.tsx
│   │   │   ├── HistoryPage.tsx
│   │   │   ├── LoginPage.tsx
│   │   │   ├── MonitoringPage.tsx
│   │   │   └── SettingsPage.tsx
│   │   └── main.tsx                 # Point d'entrée React
│   └── package.json
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
│   │   ├── staging/                 # Environnement de staging
│   │   └── prod/                    # Environnement de production
│   ├── guardrails/                  # Règles de contrôle IaC
│   └── modules/
│       ├── ec2/                     # Module EC2
│       ├── networking/              # Module réseau
│       └── security/                # Module sécurité
│
├── tests/
│   ├── backend/                     # Tests unitaires backend
│   ├── frontend/                    # Tests frontend
│   └── integration/                 # Tests d'intégration
│
├── docs/                           # Documentation du projet
├── .github/                        # Workflows GitHub
├── .env.example                    # Exemple de variables d'environnement
├── .gitignore                      # Fichiers ignorés par Git
├── docker-compose.yml              # Stack locale
├── CONTRIBUTING.md                 # Guide de contribution
└── README.md                       # Documentation principale
Prérequis

Avant de lancer le projet, il faut installer :

Python 3.10 ou supérieur
Node.js 18 ou supérieur
npm
Git
Docker et Docker Compose
Terraform
Jenkins
SonarQube
Trivy
Un compte GitHub
Un compte AWS
Une clé API Groq
Installation
1. Cloner le projet
git clone https://github.com/oussama-bagy/Next-Gen-DevSecOps.git
cd Next-Gen-DevSecOps
2. Préparer le fichier d'environnement
cp .env.example .env

Ensuite, modifier le fichier .env avec les vraies valeurs locales.

Important : le fichier .env ne doit jamais être envoyé sur GitHub.

3. Installer le backend
cd backend
pip install -r requirements.txt
4. Lancer le backend
uvicorn main:app --reload --port 8000

Le backend sera disponible sur :

http://localhost:8000

La documentation Swagger sera disponible sur :

http://localhost:8000/docs
5. Installer le frontend

Dans un autre terminal :

cd frontend
npm install
6. Lancer le frontend
npm run dev

L'interface sera disponible sur :

http://localhost:5173
7. Lancer les services avec Docker Compose

Selon la configuration locale du projet :

docker-compose up -d

Cette commande peut lancer les services nécessaires comme le backend, le monitoring,
ou les outils associés selon le contenu du fichier docker-compose.yml.

Variables d'environnement

Les variables sensibles doivent être placées dans le fichier .env.

Variable	Description
GROQ_API_KEY	Clé API utilisée pour communiquer avec le modèle IA
JWT_SECRET_KEY	Clé secrète utilisée pour signer les tokens JWT
GITHUB_TOKEN	Token GitHub utilisé pour pousser les artefacts générés
GITHUB_REPO	Dépôt GitHub cible pour les pipelines générés
AWS_ACCESS_KEY_ID	Identifiant d'accès AWS
AWS_SECRET_ACCESS_KEY	Clé secrète AWS
AWS_REGION	Région AWS utilisée par Terraform
SONAR_TOKEN	Token utilisé pour l'analyse SonarQube
PROMETHEUS_PORT	Port d'exposition des métriques Prometheus

Exemple :

GROQ_API_KEY=your_groq_api_key
JWT_SECRET_KEY=your_jwt_secret
GITHUB_TOKEN=your_github_token
GITHUB_REPO=username/generated-pipelines
AWS_ACCESS_KEY_ID=your_aws_access_key
AWS_SECRET_ACCESS_KEY=your_aws_secret_key
AWS_REGION=eu-west-3
SONAR_TOKEN=your_sonar_token
PROMETHEUS_PORT=9090

Le fichier .env.example peut être versionné.
Le fichier .env réel doit rester uniquement en local.

Utilisation
1. Accéder à l'application

Après le lancement du frontend, ouvrir :

http://localhost:5173
2. Se connecter

L'utilisateur accède à la plateforme via la page de connexion.
Le backend vérifie l'authentification à l'aide de JWT et applique un contrôle d'accès
basé sur les rôles.

3. Générer un pipeline DevSecOps

Depuis la page de génération, l'utilisateur saisit une description comme :

Créer un pipeline DevSecOps pour une application Node.js conteneurisée avec Docker,
analyse SonarQube, scan Trivy et préparation d'une infrastructure AWS avec Terraform.

La plateforme génère ensuite les artefacts nécessaires :

Jenkinsfile
Dockerfile
Fichiers Terraform
Manifestes Kubernetes
Rapport de sécurité
4. Publication sur GitHub

Après validation, les fichiers générés sont poussés automatiquement vers un dépôt GitHub
sur une branche dédiée.

5. Exécution Jenkins

Jenkins détecte la nouvelle branche grâce au pipeline multibranche, lit le Jenkinsfile,
puis exécute les étapes suivantes :

Validation des artefacts
Analyse statique avec SonarQube
Construction de l'image Docker
Scan de vulnérabilités avec Trivy
Exécution de terraform plan
Archivage des résultats
Envoi du rapport final au backend
6. Consultation du rapport

Depuis l'interface frontend, l'utilisateur peut consulter :

Le statut du pipeline
Les résultats SonarQube
Les résultats Trivy
Le niveau de risque
Les logs principaux
Le rapport final téléchargeable
Sécurité

La plateforme applique plusieurs mécanismes de sécurité afin de réduire les risques liés
à l'utilisation de l'IA, aux secrets, aux artefacts générés et à l'automatisation CI/CD.

Mécanisme	Description
Validation du prompt	Bloque les demandes dangereuses, destructrices ou non conformes
Prompt système renforcé	Encadre le comportement du modèle IA
Mode JSON structuré	Réduit les réponses incomplètes ou non exploitables
Validation des artefacts	Vérifie les fichiers générés avant leur publication
Templates de secours	Remplacent les artefacts incomplets par des versions valides
JWT	Sécurise l'authentification utilisateur
RBAC	Limite les actions selon le rôle de l'utilisateur
GitHub Token	Permet le push automatique sans exposer les identifiants
Jenkins Credentials	Protège les secrets utilisés dans les pipelines
SonarQube	Analyse statique du code
Trivy	Scan de vulnérabilités des images Docker
Terraform plan	Vérifie l'infrastructure avant tout déploiement réel
Prometheus	Collecte les métriques techniques
Grafana	Visualise l'état de la plateforme
Tests
Tests backend
pytest tests/backend -v
Tests avec couverture
pytest tests/backend --cov=backend --cov-report=html
Tests frontend
cd frontend
npm test
Vérification Git
git status --short
Vérification des fichiers ignorés
git check-ignore -v .env
git check-ignore -v frontend/node_modules
git check-ignore -v terraform/.terraform
Nettoyage local recommandé

Certains fichiers ne doivent pas être versionnés car ils sont générés automatiquement
ou contiennent des informations locales.

À supprimer localement si nécessaire :

git clean -fdX -e .env -e start.ps1

Cette commande supprime les fichiers ignorés par Git tout en conservant :

.env
start.ps1

Fichiers généralement ignorés :

.env
.pytest_cache/
__pycache__/
frontend/node_modules/
frontend/dist/
frontend/.vite/
terraform/.terraform/
terraform/terraform.tfstate
terraform/terraform.tfstate.backup
Bonnes pratiques Git

Avant chaque commit :

git status --short

Ajouter uniquement les fichiers utiles :

git add README.md
git add backend/
git add frontend/src/
git add terraform/
git add monitoring/
git add jenkins/

Créer un commit :

git commit -m "docs: update final project README"

Pousser vers GitHub :

git push origin main

Ne jamais pousser :

.env
node_modules/
dist/
.vite/
.terraform/
terraform.tfstate
__pycache__/
.pytest_cache/
Contribuer

Voir le fichier CONTRIBUTING.md pour les conventions de branches,
de commits et de contribution au projet.

Auteurs

Projet Fin de Semestre — ENSA Marrakech 2026

Bagy Oussama
Sayf Eddine Laamri

Filière : Cybersécurité & Télécommunications

Conclusion

Next-Gen DevSecOps démontre qu'il est possible de combiner l'intelligence artificielle,
l'automatisation CI/CD, la sécurité continue, l'Infrastructure as Code, le cloud computing
et le monitoring dans une plateforme moderne et cohérente.

La plateforme constitue une base solide pour évoluer vers des fonctionnalités plus avancées,
comme l'auto-correction des erreurs, l'estimation des coûts AWS, le déploiement complet
vers ECS, le monitoring avancé et le support multi-cloud.
