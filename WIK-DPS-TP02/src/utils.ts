/**
 * Vérifie si une chaîne est vide ou ne contient que des espaces
 * @param str La chaîne à vérifier
 * @returns true si la chaîne est vide ou ne contient que des espaces
 */
export function isEmpty(str: string): boolean {
  return !str || str.trim().length === 0;
}

/**
 * Génère un identifiant unique
 * @returns Une chaîne représentant un identifiant unique
 */
export function generateId(): string {
  return Math.random().toString(36).substring(2, 15) + 
         Math.random().toString(36).substring(2, 15);
}
