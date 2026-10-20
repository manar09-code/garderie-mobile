import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:garderie_mobile/main.dart';

Future<void> _openHome(WidgetTester tester) async {
  await tester.pumpWidget(const MaGarderieApp());
  await tester.pump(const Duration(seconds: 3));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets(
    'shows the splash screen and opens the home page after 3 seconds',
    (tester) async {
      await tester.pumpWidget(const MaGarderieApp());

      expect(find.text('Ma Garderie'), findsOneWidget);
      expect(
        find.text('Grandir, jouer et s’épanouir ensemble'),
        findsOneWidget,
      );
      expect(find.text('Bienvenue à Ma Garderie'), findsNothing);

      await tester.pump(const Duration(seconds: 3));
      await tester.pumpAndSettle();

      expect(find.text('Bienvenue à Ma Garderie !'), findsOneWidget);
      expect(find.text('Dessin et coloriage'), findsOneWidget);
      expect(find.text('Jeux éducatifs'), findsOneWidget);
      expect(find.text('Musique et chansons'), findsOneWidget);
      expect(find.text('Lecture de contes'), findsOneWidget);
      expect(find.text('Activités sportives'), findsOneWidget);
    },
  );

  testWidgets('the floating action button shows a message', (tester) async {
    await _openHome(tester);
    await tester.tap(find.byTooltip('Nouvelle activité'));
    await tester.pumpAndSettle();

    expect(find.text('Nouvelle activité'), findsOneWidget);
  });

  testWidgets('tapping an activity shows its title', (tester) async {
    await _openHome(tester);
    final activity = find.text('Dessin et coloriage');
    await tester.ensureVisible(activity);
    await tester.tap(activity);
    await tester.pumpAndSettle();

    expect(find.text('Dessin et coloriage'), findsNWidgets(2));
    expect(find.byType(SnackBar), findsOneWidget);
  });

  testWidgets('drawer selections open the selected section', (tester) async {
    await _openHome(tester);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await tester.tap(find.text('À propos'));
    await tester.pumpAndSettle();

    expect(
      find.text('Une garderie pensée pour le bien-être des enfants.'),
      findsOneWidget,
    );
  });
}
