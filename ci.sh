#!/bin/bash

set -Eeuo pipefail

# Configuration
URL="${1:-}"
DOSSIER="ci-project"
LOG_FILE="ci.log"

# Fonction de journalisation
journaliser() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Vérification de l'argument
if [ -z "$URL" ]; then
    journaliser "ERREUR : URL du dépôt manquante."
    exit 1
fi

# Clonage ou mise à jour du dépôt
if [ ! -d "$DOSSIER/.git" ]; then

    journaliser "Clonage du dépôt..."

    if ! git clone "$URL" "$DOSSIER"; then
        journaliser "ERREUR : échec du clonage."
        exit 1
    fi

else

    journaliser "Mise à jour du dépôt..."

    if ! git -C "$DOSSIER" pull; then
        journaliser "ERREUR : échec de la mise à jour."
        exit 1
    fi

fi

# Fonction de test
executer_tests() {

    journaliser "Début des tests..."

    if git -C "$DOSSIER" diff --check; then
        journaliser "TESTS REUSSIS."
        return 0
    else
        journaliser "ERREUR : les tests ont échoué."
        return 1
    fi
}

# Exécution des tests
if executer_tests; then
    journaliser "Pipeline terminé avec succès."
    exit 0
else
    journaliser "Pipeline terminé avec erreur."
    exit 1
fi


