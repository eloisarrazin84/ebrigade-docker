# eBrigade Docker Deployment
# Prérequis

- Docker

- Docker Compose

- Accès SSH à votre serveur

# Installation (sur le serveur)

# Se connecter en SSH à votre serveur :
ssh user@monserveur.com

# Créer un dossier pour le projet :
mkdir -p /opt/ebrigade
cd /opt/ebrigade

# Cloner le dépôt GitHub dans ce dossier :
git clone https://github.com/mon-utilisateur/ebrigade.git .
Créer et configurer les fichiers nécessaires (par exemple .env) si requis par le projet.

# Lancer le script d'initialisation :
chmod +x init.sh
./init.sh

# Accès à l’application

- Interface Web : http://monserveur.com:8085

- phpMyAdmin (si activé) : http://monserveur.com:8086

- Identifiant : root, Mot de passe : rootpass

# SMTP

Le système est configuré pour envoyer des emails via un serveur SMTP (ex. : Office 365).
Les variables sont définies dans le fichier .env.
