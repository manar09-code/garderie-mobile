import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const _destinations = [
    (label: 'Accueil', icon: Icons.home_rounded),
    (label: 'Activités', icon: Icons.palette_rounded),
    (label: 'À propos', icon: Icons.info_outline_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        backgroundColor: colorScheme.surface,
        foregroundColor: const Color(0xFF315C4C),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                color: const Color(0xFFE5F3E9),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.child_care_rounded,
                        color: Color(0xFF4E8973),
                        size: 34,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Ma Garderie',
                      style: TextStyle(
                        color: Color(0xFF315C4C),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('Grandir et s’épanouir ensemble'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              for (var i = 0; i < _destinations.length; i++)
                ListTile(
                  leading: Icon(_destinations[i].icon),
                  title: Text(_destinations[i].label),
                  selected: _selectedIndex == i,
                  selectedColor: const Color(0xFF315C4C),
                  selectedTileColor: const Color(0xFFE5F3E9),
                  onTap: () {
                    setState(() => _selectedIndex = i);
                    Navigator.of(context).pop();
                  },
                ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          _SectionPlaceholder(
            title: 'Bienvenue à Ma Garderie !',
            description: 'Un espace pour grandir, jouer et apprendre ensemble.',
            icon: Icons.waving_hand_rounded,
          ),
          _SectionPlaceholder(
            title: 'Les activités',
            description: 'Les activités de la garderie apparaîtront ici.',
            icon: Icons.toys_rounded,
          ),
          _SectionPlaceholder(
            title: 'À propos',
            description: 'Une garderie pensée pour le bien-être des enfants.',
            icon: Icons.favorite_rounded,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Nouvelle activité',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SectionPlaceholder extends StatelessWidget {
  const _SectionPlaceholder({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: const Color(0xFF77A78F)),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF315C4C),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
