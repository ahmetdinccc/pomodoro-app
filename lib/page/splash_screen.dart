import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF250E42),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Ellipse 3.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const Positioned(
            top: 75,
            left: 80,
            child: Text(
              "Pomodoro App",
              style: TextStyle(
                color: Color(0xFF2514EC),
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: _animation.value,
                  child: Opacity(
                    opacity: _opacity,
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                'assets/images/splash screen-Photoroom 2.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
