#!/bin/bash
set -e

echo "Construction des images Docker..."
docker build -t wik-dps-tp02 .
docker build -t wik-dps-tp02-multi -f Dockerfile.multi .
docker build -t wik-dps-tp02-tiny -f Dockerfile.tiny .

echo "Scan de l'image à stage unique avec Trivy..."
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image wik-dps-tp02

echo "Scan de l'image multi-stage avec Trivy..."
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image wik-dps-tp02-multi

echo "Affichage de la taille de l'image tiny-counter..."
docker images wik-dps-tp02-tiny --format "{{.Size}}"
