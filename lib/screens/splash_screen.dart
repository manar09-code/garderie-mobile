import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 250,
                  child: CustomPaint(
                    painter: _DaycareIllustrationPainter(),
                    child: Center(
                      child: Semantics(
                        label: 'Illustration colorée d’une garderie avec des enfants',
                        child: const Icon(
                          Icons.child_care_rounded,
                          color: Color(0xFF4E8973),
                          size: 54,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  'Ma Garderie',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color(0xFF315C4C),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Grandir, jouer et s’épanouir ensemble',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge
                      ?.copyWith(color: const Color(0xFF718078)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DaycareIllustrationPainter extends CustomPainter {
  const _DaycareIllustrationPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 300;
    final scaleY = size.height / 250;
    canvas.save();
    canvas.scale(scaleX, scaleY);

    final paint = Paint()..style = PaintingStyle.fill;
    canvas.drawOval(
      const Rect.fromLTWH(20, 12, 260, 220),
      paint..color = const Color(0xFFE5F3E9),
    );
    canvas.drawCircle(
      const Offset(245, 47),
      22,
      paint..color = const Color(0xFFFFCE70),
    );

    final school = Path()
      ..moveTo(59, 108)
      ..lineTo(150, 47)
      ..lineTo(241, 108)
      ..close();
    canvas.drawPath(school, paint..color = const Color(0xFFF3A77A));
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(75, 104, 150, 99),
        const Radius.circular(10),
      ),
      paint..color = const Color(0xFFFFF6E7),
    );

    for (final x in [91.0, 178.0]) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, 121, 38, 37),
          const Radius.circular(7),
        ),
        paint..color = const Color(0xFFB9DFD3),
      );
      canvas.drawLine(
        Offset(x + 19, 122),
        Offset(x + 19, 157),
        paint
          ..color = const Color(0xFFFFF6E7)
          ..strokeWidth = 3,
      );
      canvas.drawLine(
        Offset(x + 1, 140),
        Offset(x + 37, 140),
        paint
          ..color = const Color(0xFFFFF6E7)
          ..strokeWidth = 3,
      );
    }
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(135, 159, 31, 44),
        const Radius.circular(12),
      ),
      paint..color = const Color(0xFF77A78F),
    );
    canvas.drawCircle(
      const Offset(150, 180),
      2,
      paint..color = const Color(0xFFFFCE70),
    );

    _drawChild(canvas, paint, const Offset(97, 190), const Color(0xFFE98B72));
    _drawChild(canvas, paint, const Offset(205, 190), const Color(0xFF8299D5));

    canvas.drawOval(
      const Rect.fromLTWH(42, 198, 216, 18),
      paint..color = const Color(0xFF9BC69D),
    );
    for (final center in [const Offset(54, 174), const Offset(263, 175)]) {
      canvas.drawLine(
        center,
        center.translate(0, 28),
        paint
          ..color = const Color(0xFF649875)
          ..strokeWidth = 3,
      );
      for (var i = 0; i < 5; i++) {
        final angle = i * math.pi * 2 / 5;
        canvas.drawCircle(
          center.translate(math.cos(angle) * 7, math.sin(angle) * 7),
          4,
          paint..color = const Color(0xFFF2A6A4),
        );
      }
      canvas.drawCircle(center, 3, paint..color = const Color(0xFFFFCE70));
    }
    canvas.restore();
  }

  void _drawChild(Canvas canvas, Paint paint, Offset center, Color shirtColor) {
    canvas.drawCircle(
      center.translate(0, -14),
      10,
      paint..color = const Color(0xFFF0BE98),
    );
    canvas.drawCircle(
      center.translate(0, -18),
      10,
      paint..color = const Color(0xFF795C4C),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: center, width: 19, height: 20),
        const Radius.circular(7),
      ),
      paint..color = shirtColor,
    );
    canvas.drawLine(
      center.translate(-5, 8),
      center.translate(-7, 16),
      paint
        ..color = const Color(0xFF536B61)
        ..strokeWidth = 3,
    );
    canvas.drawLine(
      center.translate(5, 8),
      center.translate(7, 16),
      paint
        ..color = const Color(0xFF536B61)
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(covariant _DaycareIllustrationPainter oldDelegate) =>
      false;
}
