import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전화번호 로그인')
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('ㄴㄴㄴㄴㄴ'),
              TextFormField()
            ],
          )
        ],
      ),
    );
  }
}
