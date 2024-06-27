# Karim AUBRY - Projet Cloud AWS Wordpress Terraform

## Dossier Architecture Technique

---

### CONTEXTE

#### DESCRIPTION DU PROJET
Ce Document d'Architecture Technique a pour objectif de décrire en détail l'architecture et la mise en œuvre technique du déploiement d’un serveur web WordPress et de sa base de données MariaDB sur Amazon Web Services de manière automatisée à l'aide de Terraform.

---

### HYPOTHÈSES CONTRAINTES ET EXIGENCES GÉNÉRALES
Le déploiement d'un serveur web WordPress sur AWS à l'aide de Terraform repose sur :

- L'hypothèse que toutes les autorisations et configurations AWS nécessaires sont en place avec une connexion stable et sécurisée pour les administrateurs.
- Les contraintes incluent la sécurité des flux, la restriction des accès notamment SSH, la minimisation des coûts et la garantie de la performance et de la disponibilité via des configurations adaptées et d’un load balancer.
- Les exigences générales stipulent que l'infrastructure doit être définie et automatisée avec Terraform, utiliser Amazon EC2 pour la création du serveur web et Amazon RDS pour la base de données.

---

### ARCHITECTURE TECHNIQUE CIBLE

#### PRINCIPES GÉNÉRAUX

- Utilisation de zones de disponibilité multiples pour assurer une haute disponibilité.
- Sécurité renforcée grâce à des groupes de sécurité bien définis.
- Gestion de l'infrastructure en tant que code avec Terraform.

#### ARCHITECTURE LOGIQUE

##### COMPOSANTS LOGIQUES
Les composants logiques incluent :

- VPC (Virtual Private Cloud)
- Sous-réseaux (Subnets)
- Groupes de sécurité (Security Groups)
- Instances EC2 (Elastic Compute Cloud)
- Amazon RDS (Relational Database Service)
- NAT Gateway
- Internet Gateway

##### MATRICE D'ÉCHANGE DE DONNÉES
Les échanges de données se feront principalement via :

- HTTP/HTTPS : Pour les communications entre les utilisateurs et les applications web.
- MySQL : Pour les interactions avec la base de données.

---

### ARCHITECTURE PHYSIQUE

#### DISTRIBUTION ET ORGANISATION DES COMPOSANTS DE LA SOLUTION
Les composants de la solution sont répartis et organisés comme suit :

- Instances EC2 : Hébergeant le serveur web WordPress.
- Amazon RDS : Héberge la base de données MySQL.
- VPC et sous-réseaux : Fournissent un environnement réseau isolé.
- NAT Gateway et Internet Gateway : Gèrent le trafic entrant et sortant.
- Groupes de sécurité : Contrôlent l'accès aux ressources.

##### FLUX PHYSIQUES ET PROTOCOLES NON-APPLICATIONS

- HTTP/HTTPS : Pour les communications entre les utilisateurs et le serveur web.
- MySQL : Pour les interactions entre le serveur web et la base de données.
- SSH : Pour la gestion et la maintenance des instances EC2.

#### DISTRIBUTION PHYSIQUE DES ENVIRONNEMENTS LOGIQUES
Les environnements seront distribués dans des sous-réseaux publics et privés pour la sécurité et la gestion.

---

### ARCHITECTURE DU SYSTÈME

L'architecture du système est conçue pour assurer la résilience et la scalabilité en utilisant :

- Une instance EC2 avec un load balancer pour la répartition de la charge web
- Un RDS pour la base de données.

### ARCHITECTURE RÉSEAU

L'architecture réseau inclut :

- VPC : Contient tous les composants réseau.
- Sous-réseaux publics et privés : Séparent les ressources accessibles depuis Internet de celles qui ne le sont pas.
- Internet Gateway : Permet aux instances dans les sous-réseaux publics d'accéder à Internet.
- NAT Gateway : Permet aux instances dans les sous-réseaux privés d'accéder à Internet de manière sécurisée.
- Groupes de sécurité : Gèrent les règles de trafic entrant et sortant.

---

### ÉLÉMENTS LOGICIELS (INFRASTRUCTURE)
L'infrastructure utilise Terraform pour la gestion et l'orchestration des ressources AWS. Les configurations sont stockées dans un dépôt Git pour assurer la gestion de version et la collaboration.

### ÉLÉMENTS MATÉRIELS
Les éléments matériels incluent les instances EC2 pour le serveur web et les bases de données, et divers composants réseau AWS pour assurer la connectivité et la sécurité.

#### Exigences de Structuration

- **Disponibilité** : Utilisation de plusieurs zones de disponibilité pour assurer la redondance.
- **Sécurité** : Mise en place de groupes de sécurité stricts et utilisation de NAT Gateway pour les sous-réseaux privés.

---

### Plateforme AWS
Pour l'environnement AWS, les types de machines utilisés incluent :

- **EC2 T3a.Small** :
  - Utilisation : Hébergement du serveur web WordPress.
  - Configuration : Instances EC2 de type t2.medium pour équilibrer le coût et les performances.
  - Sécurité : Accès SSH limité à des adresses IP spécifiques, communication sécurisée via HTTPS.

---

### ARCHITECTURE RÉSEAU

L'architecture réseau est conçue pour fournir une connectivité sécurisée et performante aux composants de la solution déployée sur AWS en utilisant une combinaison de sous-réseaux publics et privés, des gateways et des groupes de sécurités.

---

### CONTINUITÉ DU SERVICE TECHNIQUE

#### REDONDANCE
La mise en place d’un load balancer pour la répartition de la charge web.

#### TOLÉRANCE AUX PANNES
Les ressources critiques sont déployées sur plusieurs zones de disponibilité pour la tolérance aux pannes.

#### GESTION DES CLÉS DE CHIFFREMENT
Les clés de chiffrement sont gérées par AWS KMS (Key Management Service) avec des politiques de rotation et de gestion appropriées.

#### FONCTIONS DE SAUVEGARDE ET DE RÉCUPÉRATION
Les sauvegardes de la base de données RDS sont effectuées de manière régulière et automatisée.

#### GESTION DES CORRECTIFS
Les mises à jour de sécurité et les correctifs sont appliqués régulièrement aux instances EC2.

---

### PERFORMANCE
Le système est conçu pour gérer les charges de travail prévues en utilisant des instances EC2 adaptées et des stratégies de répartition de la charge.

### NORMES ET STANDARDS APPLIQUÉS
Les normes et standards appliqués incluent les meilleures pratiques de sécurité et de gestion, que ce soit au niveau de Terraform ou de l'infrastructure AWS.

---

### SÉCURITÉ

#### POLITIQUES DE SÉCURITÉ
Des groupes de sécurité stricts sont mis en place pour contrôler l'accès et protéger les données.

#### AUTHENTIFICATION
Utilisation de IAM (Identity and Access Management) pour gérer l'authentification des utilisateurs et des services.

#### AUTHENTIFICATION DES UTILISATEURS FINAUX
Les utilisateurs finaux sont authentifiés via des méthodes sécurisées telles que les connexions HTTPS et les authentifications multi-facteurs.

### CONTRÔLE D'ACCÈS ET AUTORISATION

#### CONTRÔLE D'ACCÈS
Les accès sont contrôlés par des politiques IAM et des groupes de sécurité.

#### AUTORISATION
Les autorisations sont gérées en fonction des rôles et des responsabilités des utilisateurs.

---

### ACTEURS EN RELATION AVEC LE SYSTÈME (GESTION DES RÔLES)

Les autorisations sont gérées en fonction des rôles et des responsabilités des utilisateurs:

- **Administrateurs** : gestion de l'infrastructure et de la sécurité.
- **Utilisateurs WordPress** : gestion du site web.

#### RÈGLES D'ACCÈS AU SYSTÈME
Les règles d'accès sont basées sur le principe du moindre privilège et sont régulièrement révisées.

### CONFIDENTIALITÉ ET INTÉGRITÉ

#### DONNÉES EN TRANSIT
Les données en transit sont chiffrées via TLS (Transport Layer Security).

#### DONNÉES STOCKÉES
Les données stockées sont chiffrées à l'aide de services AWS comme RDS.

---

### DONNÉES VOLUMÉTRIQUES

#### NOMBRE D'UTILISATEURS
Le système est conçu pour supporter en moyenne 1000 utilisateurs simultanés.

#### CHARGE DU RÉSEAU
Le trafic réseau est surveillé et optimisé pour assurer la performance.

#### CHARGE DES MACHINES
Les charges des instances EC2 sont réparties et surveillées.

#### VOLUME STOCKÉ
Le volume de données stockées est de 20 Go.

#### VOLUME DES ÉCHANGES
Les échanges se font entre l'instance EC2 et notre RDS.

---

### SURVEILLANCE
Nous utilisons des services comme AWS CloudWatch pour la surveillance en temps réel des performances et des événements.

### ADMINISTRATION ET OPÉRATION
L'administration du système est centralisée via AWS Management Console, AWS CLI et Terraform pour l'infrastructure.

---

### COÛTS

---

### BIBLIOTHÈQUE DE DOCUMENTATION GÉNÉRALE/ANNEXES
- [Terraform](https://www.terraform.io/)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Console AWS](https://aws.amazon.com/fr/)
