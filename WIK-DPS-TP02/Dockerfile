FROM node:18-alpine

# Création d'un utilisateur spécifique pour l'exécution
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Configuration du répertoire de travail
WORKDIR /app

# Copie des fichiers de dépendances d'abord pour optimiser le cache
COPY package*.json ./

# Installation des dépendances
RUN npm ci

# Copie des sources
COPY tsconfig.json ./
COPY src/ ./src/

# Compilation du TypeScript
RUN npm run build

# Exposition du port (à adapter selon votre API)
EXPOSE 3000

# Utilisation de l'utilisateur non-root
USER appuser

# Commande de démarrage
CMD ["node", "dist/index.js"]
