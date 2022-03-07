import 'package:dooramgi/utils/logger.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  PageController controller;
  IntroPage(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: LayoutBuilder(
        builder: (contaxt, constraints){

          // 각 기기의 사이즈를 가져오는부분, 해당 사이즈로 레이아웃을 조절하자
          Size size = MediaQuery.of(context).size;

          // final sizeOfPosImg = size.width * 0.1;

          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('로그인패이지 작업',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Pretendard',
                          color: Theme.of(context).colorScheme.primary)
                  ),
                  TextButton(onPressed: (){
                    controller.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease
                    );
                    logger.d('on Text button clicked!');
                  },
                      child: Text('로그인'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
