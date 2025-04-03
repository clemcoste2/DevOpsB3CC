import express, { Request, Response } from 'express';

// Création de l'application Express
const app = express();
const port = process.env.PING_LISTEN_PORT || 3000;

// Middleware pour analyser les requêtes JSON
app.use(express.json());

// Route PING
app.get('/ping', (req: Request, res: Response) => {
  // Réponse avec les headers de la requête au format JSON
  res.status(200).json(req.headers);
});

// Route par défaut (404)
app.all('*', (req: Request, res: Response) => {
  res.status(404).end();
});

// Démarrage du serveur
app.listen(port, () => {
  console.log(`Serveur en écoute sur le port ${port}`);
});

// Gestion des signaux pour arrêt propre
process.on('SIGINT', () => {
  console.log('Arrêt du serveur...');
  process.exit(0);
});

process.on('SIGTERM', () => {
  console.log('Arrêt du serveur...');
  process.exit(0);
});

export default app;
