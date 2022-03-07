import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


final String SplashAnimalImg = 'assets/images/dooramgi_animal.svg';
final String SplashWheelImg = 'assets/images/dooramgi_wheel.svg';


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
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-0.13, 0.0),
    end: const Offset(-0.13, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInToLinear,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFfdfef8),
      child:
      Center(
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
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
            SlideTransition(
              position: _offsetAnimation,
              child: SvgPicture.asset(
                SplashAnimalImg,
                width: 200,
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}