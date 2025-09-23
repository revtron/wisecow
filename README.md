# Cow wisdom web server

## Prerequisites

```
sudo apt install fortune-mod cowsay -y
```

## How to use?

1. Run `./wisecow.sh`
2. Point the browser to server port (default 4499)

## What to expect?
![wisecow](https://github.com/nyrahul/wisecow/assets/9133227/8d6bfde3-4a5a-480e-8d55-3fef60300d98)


# Wisecow Application - Containerization and Kubernetes Deployment

## Project Overview
This project demonstrates the containerization and deployment of the **Wisecow** application using Docker and Kubernetes. The application has been deployed with a CI/CD pipeline using GitHub Actions, and additional tasks such as system health monitoring, log analysis, and security policies (KubeArmor) have been implemented.

---

## Repository
[GitHub Repository Link](https://github.com/nyrahul/wisecow)

---

## Steps Completed

### 1. Dockerization
- Created a Dockerfile for the Wisecow application.
- Built and tested the Docker image locally.
- Pushed the image to Docker Hub: `revtron/wisecow:latest`.

### 2. Kubernetes Deployment
- Deployed Wisecow using Kubernetes manifests:
  - `deployment.yaml`  
  - `service.yaml`  
  - `ingress.yaml` with TLS
- Exposed the application via Ingress with HTTPS:
  - URL: [https://wisecow-production.up.railway.app/](https://wisecow-production.up.railway.app/)
- Verified the application is running properly on Kubernetes.

### 3. CI/CD Pipeline
- Implemented GitHub Actions workflow:
  - Builds and pushes Docker image to Docker Hub on commit.
  - (Optional) Deploy to Railway automatically.
- Workflow YAML: `.github/workflows/ci-cd.yml`
- Verified successful runs and Docker pushes.

### 4. System Health Monitoring Script
- Script: `system_health.sh`
- Monitors:
  - CPU usage
  - Memory usage
  - Disk usage
  - Running processes
- Alerts if thresholds exceed limits (CPU > 80%, MEM > 80%, Disk > 80%).
- Logs stored in: `/var/log/system_health.log`
- Can run in detached mode using: `nohup ./system_health.sh &`

### 5. Log File Analyzer Script
- Script: `log_analyzer.sh`
- Analyzes Wisecow logs (`wisecow.log`) for:
  - Number of 404 errors
  - Top 5 requested pages
  - Top 5 IP addresses
- Output saved in `/var/log/web_log_report.log`
- Example usage:  
  ```bash
  ./log_analyzer.sh
  tail -f /var/log/web_log_report.log
<img width="1615" height="449" alt="Screenshot 2025-09-23 121448" src="https://github.com/user-attachments/assets/d8c5bd94-39ce-43d6-8e91-c573db3f7fdd" />
<img width="418" height="270" alt="Screenshot 2025-09-23 133020" src="https://github.com/user-attachments/assets/41444622-a797-4d09-b0cb-0ab012c19688" />
<img width="1884" height="611" alt="Screenshot 2025-09-23 133216" src="https://github.com/user-attachments/assets/ffad4c99-bad4-42dd-8c86-844f6f75a575" />

working link


https://wisecow-production.up.railway.app/
