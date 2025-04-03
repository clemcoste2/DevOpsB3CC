#!/bin/bash

# Script pour faciliter la configuration et le test du projet WIK-DPS-TP02

# Vérification si git est installé
if ! command -v git &> /dev/null; then
    echo "Git n'est pas installé. Veuillez l'installer d'abord."
    exit 1
fi

# Vérification si docker est installé
if ! command -v docker &> /dev/null; then
    echo "Docker n'est pas installé. Veuillez l'installer d'abord."
    exit 1
fi

# Vérification si trivy est installé
if ! command -v trivy &> /dev/null; then
    echo "Trivy n'est pas installé. Installation via Docker..."
fi

# Initialisation du repo git s'il n'est pas déjà initialisé
if [ ! -d .git ]; then
    git init
    echo "Dépôt Git initialisé"
fi

# Construction des images
echo "Construction des images Docker..."
docker build -t wik-dps-tp02 .
docker build -t wik-dps-tp02-multi -f Dockerfile.multi .
docker build -t wik-dps-tp02-tiny -f Dockerfile.tiny .

echo "Images construites avec succès"

# Menu d'options
echo "----------------------------------------"
echo "Que souhaitez-vous faire ?"
echo "1. Exécuter l'API avec l'image à stage unique"
echo "2. Exécuter l'API avec l'image multi-stage"
echo "3. Exécuter le compteur ultra-léger"
echo "4. Scanner les images avec Trivy"
echo "5. Afficher la taille des images"
echo "6. Quitter"
echo "----------------------------------------"

read -p "Votre choix (1-6) : " choice

case $choice in
    1)
        echo "Exécution de l'API avec l'image à stage unique..."
        docker run -p 3000:3000 wik-dps-tp02
        ;;
    2)
        echo "Exécution de l'API avec l'image multi-stage..."
        docker run -p 3000:3000 wik-dps-tp02-multi
        ;;
    3)
        echo "Exécution du compteur ultra-léger..."
        docker run wik-dps-tp02-tiny
        ;;
    4)
        echo "Scan des images avec Trivy..."
        chmod +x scan-images.sh
        ./scan-images.sh
        ;;
    5)
        echo "Taille des images Docker :"
        docker images wik-dps-tp02 wik-dps-tp02-multi wik-dps-tp02-tiny
        ;;
    6)
        echo "Au revoir !"
        exit 0
        ;;
    *)
        echo "Option invalide !"
        exit 1
        ;;
esac
