import 'package:dooramgi/utils/logger.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('인트로페이지'),
          TextButton(
              onPressed: (){
                logger.d('on button clicked');
              },
              child: Text('회원가입하고 시작하기'))
        ],
      ),
    );
  }
}