#!/bin/bash

set -Eeuo pipefail

# Vérification de l'argument
if [ $# -ne 1 ]; then
    echo "Erreur : veuillez indiquer un dossier à sauvegarder." >&2
    exit 1
fi

DOSSIER="$1"

# Vérification de l'existence du dossier
if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier $DOSSIER n'existe pas." >&2
    exit 1
fi

# Création du dossier des sauvegardes
BACKUP_DIR="backups"
mkdir -p "$BACKUP_DIR"

# Création d'un nom avec date et heure
DATE=$(date +%Y-%m-%d_%H-%M-%S)

ARCHIVE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Création de l'archive
tar -czf "$ARCHIVE" "$DOSSIER"

echo "Sauvegarde créée : $ARCHIVE"

# Suppression des anciennes sauvegardes
for fichier in "$BACKUP_DIR"/*.tar.gz; do

    if [ -f "$fichier" ] && find "$fichier" -mtime +7 -print -quit | grep -q .; then
        rm "$fichier"
        echo "Ancienne sauvegarde supprimée : $fichier"
    fi

done

echo "Nettoyage terminé."
exit 0

