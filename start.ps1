# Démarrer les conteneurs Docker
docker start jenkins sonarqube prometheus grafana

# Fix Docker socket permissions Jenkins
Start-Sleep -Seconds 3
docker exec -u root jenkins chmod 666 /var/run/docker.sock

Write-Host "Services démarrés :"
Write-Host "Jenkins     : http://localhost:8080"
Write-Host "SonarQube   : http://localhost:9000"
Write-Host "Prometheus  : http://localhost:9090"
Write-Host "Grafana     : http://localhost:3001"
Write-Host ""
Write-Host "Démarrer le backend :"
Write-Host "cd backend"
Write-Host "C:\Users\oussa\AppData\Local\Programs\Python\Python310\python.exe -m uvicorn main:app --reload --port 8000"