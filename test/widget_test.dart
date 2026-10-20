import 'package:flutter_test/flutter_test.dart';
import 'package:garderie_mobile/main.dart';

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
}
