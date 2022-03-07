import 'package:dooramgi/screens/start/intro_pate.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          children: [
            IntroPage(),
            Container(color: Colors.blueAccent,),
            Container(color: Colors.redAccent,),
          ]),
    );
  }
}
