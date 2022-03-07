import 'package:dooramgi/splash_screen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1), () => 100),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
            duration:Duration(seconds: 1),
            child: _splashLoadingWidget(snapshot));
      });
  }

  Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print('error occur while loading.');
      return Text('error occur!');
    } else if (snapshot.hasData) {
      return DooramgiApp();
    } else {
      return SplashScreen();
    }
  }
}

class DooramgiApp extends StatelessWidget {
  const DooramgiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
