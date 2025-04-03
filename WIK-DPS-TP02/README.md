# WIK-DPS-TP02

Ce dépôt contient les images Docker pour l'API développée dans le cadre du TP01, ainsi qu'une image ultra-légère pour le bonus.

## Contenu du projet

- `Dockerfile` : Image Docker à stage unique pour l'API
- `Dockerfile.multi` : Image Docker multi-stage pour l'API
- `Dockerfile.tiny` : Image Docker ultra-légère (< 500 octets) pour le bonus
- `scan-images.sh` : Script pour scanner les images et détecter les vulnérabilités
- `tiny-counter.c` : Programme C minimaliste pour le bonus

## Installation

Pour installer les dépendances du projet :

```bash
# Installer les dépendances
npm install
```

Pour compiler l'API en JavaScript :

```bash
# Compiler l'API
npm run build
```

## API

L'API expose un point d'accès `/ping` qui renvoie les en-têtes de la requête en format JSON.
Toutes les autres routes renvoient une réponse avec le statut 404.

## Exigences satisfaites

### Image Docker à un seul stage
- ✅ Permet d'exécuter l'API du TP01
- ✅ Optimisation des layers
- ✅ Utilisateur spécifique pour l'exécution

### Image Docker multi-stage
- ✅ Étape de build séparée
- ✅ Image d'exécution sans les sources
- ✅ Utilisateur spécifique pour l'exécution

### Bonus
- ✅ Image Docker ultra-légère < 500 octets
- ✅ Affiche les nombres de 0 à 10000

## Construction des images

```bash
# Construction de l'image à stage unique
docker build -t wik-dps-tp02 .

# Construction de l'image multi-stage
docker build -t wik-dps-tp02-multi -f Dockerfile.multi .

# Construction de l'image ultra-légère
docker build -t wik-dps-tp02-tiny -f Dockerfile.tiny .
```

## Exécution des images

```bash
# Exécution de l'API avec l'image à stage unique
docker run -p 3000:3000 wik-dps-tp02

# Exécution de l'API avec l'image multi-stage
docker run -p 3000:3000 wik-dps-tp02-multi

# Exécution du compteur ultra-léger
docker run wik-dps-tp02-tiny
```

## Scan de sécurité

Les images ont été scannées avec Trivy pour détecter les vulnérabilités.

```bash
# Rendre le script exécutable
chmod +x scan-images.sh

# Exécuter le scan
./scan-images.sh
```

## Optimisations réalisées

1. **Ordre des layers** :
   - Copie des fichiers de dépendances avant le code source
   - Installation des dépendances avant la compilation

2. **Multi-stage build** :
   - Séparation du build et de l'exécution
   - Réduction significative de la taille de l'image finale

3. **Image ultra-légère** :
   - Compilation statique et optimisée
   - Utilisation de l'image `scratch` comme base
   - Élimination de toutes dépendances superflues
