#!/bin/bash

# Ajouter l'utilisateur "utilisateur1" aux sudoers
mkdir -p /home/mateo-nicoud/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDlQCXgHItq5iEa8bZEWflEWJkQl7aAZyQzAEbABDfvOzB4HBqaUt+gx+XR6DmpXEXYd6kdcfVH1TAbWRQ7Enl2vxYHELBbfpV2/l4+8HYIyEHaO6q2uCwrNAhfTw2W6bUttTqM6h1QH49tHstpuwbzaP/oa9pS0AqhTBi9st7uEfApA+hg/ymGnkVHENWLysXkNJcfR41oyOvxx2xjiY5UvtxORbMr6lYkz+zB2/DuDYzwFrUIPDCmRwu2JsOxfzPIWHBmmrjJZoaQzEzIJP7oJB/3XUSp9F8XYlE7GD9oaYAglcU7j7lZq6Qv1p81bdbu7bsF7Ctho1QevjurpQS7CsDnL16/afOl6s+j6wtYrkdU/NTbCp2Z5V5pJuBdkG4abNASENTZ+/hUkr6dBviOzhTwB41xoCCPQ+6nA4+RO7zSYmKk98rliJp/zBCmaHzTtjPgKOzTOQ3V4TOLbkjCS1RH/2ysSqqTzyUE9CkGa4Slfb3W4l0qoSs6nDi+40M= mateo-nicoud@mateonicoud-desktop">> /home/mateo-nicoud/.ssh/authorized_keys
chown mateo-nicoud:mateo-nicoud /home/mateo-nicoud/.ssh
chown mateo-nicoud:mateo-nicoud /home/mateo-nicoud/.ssh/authorized_keys
chmod 700 /home/mateo-nicoud/.ssh
chmod 600 /home/mateo-nicoud/.ssh/authorized_keys

# Mettre à jour la liste des paquets
apt update

# Installer les paquets nécessaires
apt install -y \
  openssh-server \
  sudo \
  vim \
  php8.2-fpm \
  php-xml \
  php-xmlrpc \
  apache2 \
  mariadb-server \
  php-mysql

a2dismod mpm_prefork
a2enmod proxy_fcgi setenvif mpm_event
a2dissite 000-default
a2enconf php8.2-fpm

echo "mateo-nicoud ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
