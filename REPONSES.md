# TP N°2 – Linux et Scripting Bash
## Réponses aux questions de réflexion

### Exercice 2.1 – Navigation, recherche et permissions

**Question : Que signifie la commande chmod 644 ?**

La commande `chmod 644` donne les permissions suivantes :
- Propriétaire : lecture et écriture.
- Groupe : lecture seulement.
- Autres utilisateurs : lecture seulement.

Le fichier n'est donc pas exécutable.

### Exercice 2.2 – Script check_disk.sh

**Question : Pourquoi utiliser des guillemets autour de "$UTILISATION" ?**

Les guillemets permettent de protéger la valeur de la variable et de la traiter comme un seul argument. Ils évitent les problèmes liés aux espaces et aux caractères spéciaux.

### Exercice 2.3 – Script backup.sh

**Question : Que se passe-t-il si on supprime set -Eeuo pipefail ?**

Le script risque de continuer son exécution même si une commande échoue. Par exemple, si la commande `tar` échoue, le script pourrait afficher un message indiquant que la sauvegarde a été créée alors que ce n'est pas le cas.

### Exercice 2.4 – Planification avec cron

**Question : Pourquoi utiliser des chemins absolus dans une tâche cron ?**

Cron exécute les tâches dans un environnement différent du terminal habituel. Le répertoire courant et les variables d'environnement peuvent être différents. Les chemins absolus permettent donc de retrouver correctement les scripts et les fichiers.

### Exercice 2.5 – Mini pipeline CI

**Question 1 : Quelles étapes peut-on ajouter à un pipeline CI ?**

On peut ajouter :
- L'installation des dépendances.
- La compilation du projet.
- L'exécution des tests unitaires.
- L'exécution des tests d'intégration.
- L'analyse de la qualité et de la sécurité du code.
- Le déploiement de l'application.

**Question 2 : Quels types d'erreurs peuvent survenir dans un pipeline CI ?**

Plusieurs erreurs peuvent survenir :
- Échec du clonage du dépôt.
- Échec de la mise à jour du dépôt.
- Problème d'installation des dépendances.
- Erreur de compilation.
- Échec des tests.
- Problème lors du déploiement.

Le code de sortie `0` indique généralement une réussite, tandis qu'un code différent de `0` indique une erreur.

