import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() {
  runApp(DooramgiApp());
}

final String SplashAnimalImg = 'assets/images/dooramgi_animal.svg';
final String SplashWheelImg = 'assets/images/dooramgi_wheel.svg';

class DooramgiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInToLinear
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RotationTransition(
              turns: _animation,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  SplashWheelImg,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            SvgPicture.asset(
              SplashAnimalImg,
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
      backgroundColor: Color(0XFFfdfef8),
    );
  }
}
