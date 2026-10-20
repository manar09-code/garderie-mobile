import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../widgets/activity_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Le Drawer et l'IndexedStack utilisent le même index de section.
  int _selectedIndex = 0;

  static const _destinations = [
    (label: 'Accueil', icon: Icons.home_rounded),
    (label: 'Activités', icon: Icons.palette_rounded),
    (label: 'À propos', icon: Icons.info_outline_rounded),
  ];

  void _showActivityMessage(Activity activity) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(activity.titre)));
  }

  void _showNewActivityMessage() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Nouvelle activité')));
  }

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
        children: [
          _HomeContent(onActivityTap: _showActivityMessage),
          _ActivitiesContent(onActivityTap: _showActivityMessage),
          const _SectionPlaceholder(
            title: 'À propos',
            description: 'Une garderie pensée pour le bien-être des enfants.',
            icon: Icons.favorite_rounded,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNewActivityMessage,
        tooltip: 'Nouvelle activité',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.onActivityTap});

  final ValueChanged<Activity> onActivityTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 18),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xFFE5F3E9),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenue à Ma Garderie !',
                        style: TextStyle(
                          color: Color(0xFF315C4C),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Un espace pour grandir, jouer et apprendre ensemble.',
                        style: TextStyle(color: Color(0xFF52685E), height: 1.4),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.waving_hand_rounded,
                  size: 38,
                  color: Color(0xFF4E8973),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 4),
          child: Text(
            'Nos activités',
            style: TextStyle(
              color: Color(0xFF315C4C),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ActivityList(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          onActivityTap: onActivityTap,
        ),
      ],
    );
  }
}

class _ActivitiesContent extends StatelessWidget {
  const _ActivitiesContent({required this.onActivityTap});

  final ValueChanged<Activity> onActivityTap;

  @override
  Widget build(BuildContext context) {
    return ActivityList(onActivityTap: onActivityTap);
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
