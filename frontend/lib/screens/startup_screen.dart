import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'onboarding_screen.dart';
import '../utils/custom_painters.dart';
import 'dart:math' as math;

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  final List<Widget> _animatedShapes = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _generateRandomShapes());
  }

  void _generateRandomShapes() {
    final random = math.Random();
    final size = MediaQuery.of(context).size;
    for (int i = 0; i < 5; i++) {
      final isFlower = random.nextBool();
      final color = const Color(0xFF7E57C2).withOpacity(0.3); // Purple shapes
      final shapeSize = random.nextDouble() * 40 + 20;
      final left = random.nextDouble() * (size.width - shapeSize);
      final top = random.nextDouble() * (size.height - shapeSize);
      _animatedShapes.add(
        Positioned(
          left: left,
          top: top,
          child: SizedBox(
            width: shapeSize,
            height: shapeSize,
            child: CustomPaint(
                painter: isFlower ? FlowerPainter(color) : HeartPainter(color)),
          ).animate().moveY(duration: 5.seconds, end: 50).scale(
              begin: const Offset(0.9, 0.9), end: const Offset(1.1, 1.1)),
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._animatedShapes,
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome to Eva',
                          style: Theme.of(context).textTheme.headlineLarge)
                      .animate()
                      .fadeIn(duration: 1.seconds),
                  const SizedBox(height: 16),
                  Text('Your Menstrual Health Companion',
                          style: Theme.of(context).textTheme.bodyLarge)
                      .animate()
                      .fadeIn(duration: 1.seconds, delay: 500.ms),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OnboardingScreen())),
                    child: const Text('Get Started'),
                  ).animate().fadeIn(duration: 1.seconds, delay: 1.seconds),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
