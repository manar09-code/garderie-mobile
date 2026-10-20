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

Les captures de l'application sur émulateur Android sont enregistrées ci-dessous.
Pour réaliser d'autres captures, consultez [screenshots/README.md](screenshots/README.md).

### Écran de démarrage

![Écran de démarrage](screenshots/Splash%20Screen.png)

### Page principale avec les activités

![Page principale](screenshots/Page%20principale%20avec%20la%20liste%20des%20activit%C3%A9s.png)

### Menu latéral ouvert

![Menu latéral](screenshots/Drawer%20ouvert.png)

### Message après une interaction

![Message d'interaction](screenshots/Message%20affich%C3%A9%20apr%C3%A8s%20une%20interaction.png)
