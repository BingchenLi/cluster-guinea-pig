#scripts to push the images to github 

docker build -t api:1.0 -f src/DynamicConfig.Storage.Api/Dockerfile .
docker tag api:1.0 ghcr.io/norbinto/api:1.0
docker push ghcr.io/norbinto/api:1.0

docker build -t client-service-a:1.0 -f src/clients/WorkerService.ServiceA/Dockerfile .
docker tag client-service-a:1.0 ghcr.io/norbinto/client-service-a:1.0
docker push ghcr.io/norbinto/client-service-a:1.0

docker build -t config-management-web:1.0 -f src/DynamicConfig.Management.Web/Dockerfile .
docker tag config-management-web:1.0 ghcr.io/norbinto/config-management-web:1.0
docker push ghcr.io/norbinto/config-management-web:1.0

docker build -t config-database-primer:1.0 -f src/clients/DatabasePrimer.Service/Dockerfile .
docker tag config-database-primer:1.0 ghcr.io/norbinto/config-database-primer:1.0
docker push ghcr.io/norbinto/config-database-primer:1.0