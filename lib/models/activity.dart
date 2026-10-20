class Activity {
  const Activity({
    required this.id,
    required this.titre,
    required this.description,
    required this.icone,
  });

  final int id;
  final String titre;
  final String description;
  final String icone;
}

// Données de démonstration locales, sans backend ni base de données.
const daycareActivities = [
  Activity(
    id: 1,
    titre: 'Dessin et coloriage',
    description: 'Développement de la créativité',
    icone: '🎨',
  ),
  Activity(
    id: 2,
    titre: 'Jeux éducatifs',
    description: 'Apprentissage par le jeu',
    icone: '🧩',
  ),
  Activity(
    id: 3,
    titre: 'Musique et chansons',
    description: 'Éveil musical des enfants',
    icone: '🎵',
  ),
  Activity(
    id: 4,
    titre: 'Lecture de contes',
    description: 'Découverte des histoires',
    icone: '📚',
  ),
  Activity(
    id: 5,
    titre: 'Activités sportives',
    description: 'Développement de la motricité',
    icone: '⚽',
  ),
];
