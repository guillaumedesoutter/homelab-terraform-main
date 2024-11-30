# Terraform Homelab 🚀

## Introduction

Ce dépôt présente ma manière de définir et configurer automatiquement des machines virtuelles (VM) sur mon serveur **Proxmox** dans le cadre de mon homelab. Grâce à une intégration avec **GitLab CI/CD**, chaque modification apportée au code Terraform est appliquée automatiquement, simplifiant ainsi la gestion de l'infrastructure.

En complément, **Ansible** est utilisé pour effectuer des tâches de post-déploiement sur les serveurs.

---

## Fonctionnalités

- Définir et configurer des machines virtuelles dans Proxmox de manière déclarative.
- Automatiser les workflows avec GitLab CI/CD, incluant la planification et l'application des changements Terraform.
- Utiliser des templates Cloud-Init pour standardiser les configurations initiales des VM.
- Étendre facilement l'infrastructure en ajoutant de nouvelles machines ou en ajustant les paramètres des VM existantes.
- Compléter le déploiement avec Ansible pour configurer les serveurs fraîchement créés.

---

## Architecture

4 serveurs:

1. **Proxmox** : Serveur de virtualisation pour héberger les machines virtuelles.
2. **Terraform** : Outil pour définir et gérer l'infrastructure sous forme de code.
3. **GitLab CI/CD** : Plateforme d'intégration et de déploiement continu pour automatiser les workflows Terraform.
5. **Ansible** : Automatisation des configurations post-déploiement (hostname, DNS, installations spécifiques).

---

## Flux de travail

1. Modifier les fichiers Terraform pour définir ou ajuster les ressources.
2. Pousser les modifications dans GitLab pour déclencher la pipeline CI/CD.
3. Terraform initie les actions suivantes dans la pipeline :
   - Initialiser le backend et télécharger les dépendances.
   - Générer un plan des modifications.
   - Appliquer les changements définis sur Proxmox.
4. Ansible complète le processus en exécutant les playbooks pour configurer les serveurs fraîchement déployés.

### Cheminement complet

1. **Code** :
   - Les fichiers Terraform définissent l'infrastructure souhaitée, incluant les ressources, les configurations des VM et les paramètres réseau.

2. **GitLab CI/CD** :
   - Le dépôt GitLab déclenche une **pipeline CI/CD** à chaque modification du code.
   - Les étapes incluent l'initialisation, la planification et l'application des changements Terraform.

3. **Terraform** :
   - Terraform interprète le code pour appliquer les changements au serveur Proxmox.
   - Les VM sont créées ou mises à jour automatiquement selon les configurations définies.

4. **Proxmox** :
   - Le serveur Proxmox gère les machines virtuelles créées par Terraform.

5. **Ansible** :
   - Une fois les VM en place, Ansible exécute des **playbooks de post-déploiement** pour personnaliser les serveurs.
   - Ces tâches incluent la configuration du hostname, la mise à jour du DNS et l'installation de services.

---

## Contenu du dépôt

- Configuration principale pour Terraform, y compris les variables et les modules réutilisables.
- Fichier `.gitlab-ci.yml` pour intégrer Terraform et Ansible dans les workflows GitLab.

---

## Prérequis

### Serveur Proxmox
- Avoir un serveur Proxmox configuré avec des templates Cloud-Init.

### Terraform
- Installer Terraform (version 1.5 ou supérieure recommandée).
- Configurer les accès Proxmox avec un utilisateur ayant les permissions nécessaires.

### GitLab CI/CD
- Configurer un Runner GitLab avec un tag spécifique (ex. : `ansible`).
- Ajouter les variables CI/CD nécessaires, notamment les identifiants Proxmox et les clés SSH.

### Ansible
- Disposer d'un inventaire Ansible contenant les serveurs déployés par Terraform.
- Avoir des playbooks pour gérer les configurations spécifiques aux serveurs.

---

## Licence

Ce projet est sous licence [MIT]. Vous êtes libre de l'utiliser, de le modifier et de le distribuer.

---

## Contact

Pour toute question ou suggestion, contactez-moi via GitLab ou par email.
