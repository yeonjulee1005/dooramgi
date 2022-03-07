import 'package:dooramgi/screens/start/auth_page.dart';
import 'package:dooramgi/screens/start/intro_pate.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
          // physics: NeverScrollableScrollPhysics(),
          children: [
            IntroPage(_pageController),
            AuthPage(),
            Container(color: Colors.redAccent,),
          ]),
    );
  }
}
