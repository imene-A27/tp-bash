#!/bin/bash

SEUIL=${1:-80}

UTILISATION=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$UTILISATION" -ge "$SEUIL" ]; then
    echo "ALERTE : L'espace disque utilisé est de ${UTILISATION}%"
else
    echo "Espace disque normal : ${UTILISATION}% utilisé."
fi

exit 0

