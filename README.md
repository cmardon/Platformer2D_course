<!-- 
![Texte alternatif](image.png "Le titre de mon image") 
-->

# Cours : Création d'un Platformer en 2D avec Godot

## 1. Installation
Une fois **Godot** ouvert, importer le projet en cliquant sur le bouton `Importer`, sélectionner le dossier `Platformer2D_course`, double cliquer sur `project.godot` et valider en cliquant sur `importer`

(Autre méthode: cliquer sur scanner, choisir le dossier *Téléchargements* et valider).
Le projet devrait apparaître dans la fenêtre **Godot**.

## 2. Présentation de l'interface

- Ouvrir la scène `exemple/niveaux/niveau1.tscn` dans le `Système de Fichiers` :

<img src=".images_consigne/systeme_de_fichiers.png" width="200">

---

Cette interface devrait apparaître :

<img src=".images_consigne/interface.png" width="800" align="center">

<br>

<img src=".images_consigne/interface_detaillee.png" width="800" align="center">

## 3. Lancement de l'exemple

**Avec niveau1.tscn ouvert**, cliquer sur ce bouton : <img src=".images_consigne/play_scene.png" width="300" align="center">

Le jeu doit se lancer dans une fenêtre à part. Appuyez sur les **flèches** pour bouger et sur **espace** pour sauter.

## 4. Création de son propre jeu

Les scènes pour la création du jeu sont dans le dossier `my_game/`

### Création du joueur

- Ouvrir la scène joueur.tscn, c'est la scène qui contiendra notre joueur : son image, ses collisions, son script de mouvements et actions.

<br>

- **Image** du personnage :
    - Ajouter un noeud de type `Sprite2D` (c'est le **noeud** qui permet d'afficher une image) 
    - Ajouter une texture dans l'inspecteur au niveau de `Texture <vide>` (Soit en cliquant sur `<vide>` -> Chargement Rapide -> [votre image] soit en glissant une image directement dans le rectangle `<vide>`)
    - Toujours dans l'inspecteur du noeud `Sprite2D`, cliquer sur Texture et changer `Filter`en `Nearest` (Cela rendra la texture nette)

<br>

- **Collisions** du personnage :
    - Ajouter un noeud de type `CollisionShape2D` (c'est le noeud qui donne une zone de collision au personnage, pour qu'il ne traverse pas le sol !)
    - Lui donner une forme de rectangle en cliquant, dans l'inspecteur, sur `Shape <vide>`
    - Redimensionner le rectangle au format du personnage

    L'arborescence doit ressembler à celle ci : <img src=".images_consigne/arbo_player_v1.png" align="center">

    Si ce n'est pas le cas, glisser les noeuds pour correspondre.

<br>

- **Mouvements** du personnage :
    - Cliquer sur le noeud parent (nommé "Joueur") et attacher un script avec l'icône <img src=".images_consigne/attach_script.png" align="center"> ou en faisant `clic-droit -> Attacher un script`
    - Sélectionner le modèle de script `CharacterBody2D : Basic Movement` et `Créer`

    <img src=".images_consigne/characterbody2D_modele.png" width="300" >

    - Un script devrait être généré automatiquement.

- Tester le personnage, il devrait tomber dans le vide et bouger en appuyant sur les flèches

### Création d'un niveau

### Ajout des téléporteurs entre niveaux

### Ajout d'ennemis

### Ajout de projectiles

## Vidéos 

### Création du joueur
[VIDEO_J_V1](.images_consigne/player_v1.mp4)

### Création d'un niveau

### Ajout des téléporteurs entre niveaux

### Ajout d'ennemis

### Ajout de projectiles