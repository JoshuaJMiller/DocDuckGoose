# DocDuckGoose API

A .NET 8 Web API deployed as an Azure Container App, built and managed via Terraform and Docker.

## Features

- Swagger (OpenAPI) UI
- Containerized with Docker
- Terraform IaC to deploy Azure resources
- Azure Container Registry + Container Apps

## Status

✅ Container runs successfully and serves API via Azure.  
🛠️ Future plans: Auth, DB integration, CI/CD.

---

## Dev Setup

```bash
docker build -t docduckgoose-api .
docker run -p 8080:80 docduckgoose-api
