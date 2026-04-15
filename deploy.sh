#!/bin/bash
# BidHub Railway deploy script — run from repo root (cs4135_BidHub/)
set -e

echo "==> Merging backend: development → main..."
cd backend
git checkout main
git merge --ff-only origin/development
git push origin main
git checkout development
cd ..

echo "==> Merging frontend: development → main..."
cd frontend
git checkout main
git merge --ff-only origin/development
git push origin main
git checkout development
cd ..

echo "==> Pinning submodule SHAs in root/main..."
git checkout main
git submodule update --remote --merge
SHA_B=$(git -C backend rev-parse --short HEAD)
SHA_F=$(git -C frontend rev-parse --short HEAD)
git add backend frontend
git commit -m "pin backend@${SHA_B} frontend@${SHA_F}"
git push origin main
git checkout development

echo "==> Deploying backend services to Railway..."
for svc in account-service auction-service admin-service api-gateway \
           notification-service delivery-service; do
  echo "  deploying $svc..."
  railway up --service "$svc" --detach
done

echo "==> Deploying frontend to Railway..."
railway up --service "frontend" --detach

echo "==> Done. Live at https://api-gateway-production-d819.up.railway.app"
