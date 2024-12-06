#!/bin/bash

# Définir les variables
MYSQL_ROOT_PASSWORD="Sau_stdb#GLP!"

# Script expect pour automatiser la commande mysql_secure_installation
/usr/bin/expect <<EOF
spawn mysql_secure_installation

# Attendre la demande du mot de passe actuel (si nécessaire)
expect "Enter current password for root (enter for none):"
send "\r"  # Pas de mot de passe actuel (si vous n'en avez pas encore configuré un)

# Attendre la demande de modification du mot de passe root
expect "Set root password?"
send "y\r"  # Répondre "oui"

# Entrer le nouveau mot de passe root
expect "New password:"
send "$MYSQL_ROOT_PASSWORD\r"

# Confirmer le nouveau mot de passe root
expect "Re-enter new password:"
send "$MYSQL_ROOT_PASSWORD\r"

# Répondre "y" à toutes les autres questions pour sécuriser l'installation
expect "Remove anonymous users?"
send "y\r"
expect "Disallow root login remotely?"
send "y\r"
expect "Remove test database and access to it?"
send "y\r"
expect "Reload privilege tables now?"
send "y\r"

EOF

echo "Le mot de passe root a été configuré et la sécurité MySQL a été renforcée."
