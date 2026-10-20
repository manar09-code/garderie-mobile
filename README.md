# Ma Garderie

Ma Garderie est une application mobile Flutter qui présente les activités d'une
garderie pour enfants. Elle propose un écran de démarrage, une page d'accueil,
un menu de navigation et une liste d'activités avec des interactions simples.

## Fonctionnalités

- Écran de démarrage illustré avec navigation automatique après 3 secondes.
- Accueil avec une liste de cinq activités définies localement dans le code.
- Menu latéral : Accueil, Activités et À propos.
- Bouton « + » qui affiche le message « Nouvelle activité ».
- Sélection d'une activité qui affiche son titre dans un SnackBar.

Les données sont statiques. L'application n'utilise ni backend, ni base de
données, ni authentification.

## Technologies

- Flutter et Dart
- Material Design 3
- Git et GitHub

## Prérequis

- Flutter installé (Flutter 3 ou version ultérieure).
- Android Studio avec un émulateur Android configuré, ou un appareil Android.

## Installation et lancement

```bash
git clone https://github.com/manar09-code/garderie-mobile.git
cd garderie-mobile
flutter pub get
flutter run
```

Pour choisir explicitement un émulateur connecté :

```bash
flutter devices
flutter run -d <device_id>
```

Dans Android Studio, ouvrez le dossier du projet, sélectionnez un émulateur,
puis lancez `lib/main.dart`.

## Tests et analyse

```bash
flutter analyze
flutter test
```

## Captures d'écran

Les images ci-dessous sont à enregistrer dans `screenshots/` avec les noms
indiqués. Consultez [screenshots/README.md](screenshots/README.md) pour les
étapes de capture sur l'émulateur Android Studio.

### Écran de démarrage

![Écran de démarrage](screenshots\Splash Screen.png)

### Page principale avec les activités

![Page principale](screenshots\Page principale avec la liste des activités.png)
### Menu latéral ouvert

![Menu latéral](screenshots\Drawer ouvert.png)

### Message après une interaction

![Message d'interaction](screenshots\Message affiché après une interaction.png)
