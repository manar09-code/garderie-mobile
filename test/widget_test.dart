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

      expect(find.text('Bienvenue à Ma Garderie'), findsOneWidget);
    },
  );
}
