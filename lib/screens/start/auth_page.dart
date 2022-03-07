import 'package:dooramgi/constants/common_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  TextEditingController _textEditingController = TextEditingController(
    text:'010'
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전화번호 입력',
        style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body: Padding(
        padding: EdgeInsets.all(common_padding),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _textEditingController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  MaskedInputFormatter("000 0000 0000"),
                ],
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                      Icons.phone
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  prefixIconConstraints:
                    BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    )
                ),
              ),
              SizedBox(height: common_padding),
              TextButton.icon(onPressed: () {
              },
                  icon: Icon(
                      CupertinoIcons.app_badge,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                    '인증문자 받기',
                    style: Theme.of(context).textTheme.button,
                  ),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
              TextFormField(
                controller: _textEditingController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  MaskedInputFormatter("000 0000 0000"),
                ],
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                        Icons.phone
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    prefixIconConstraints:
                    BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    )
                ),
              ),
              SizedBox(height: common_padding),
              TextButton.icon(onPressed: () {
              },
                icon: Icon(
                  CupertinoIcons.app_badge,
                  color: Colors.white,
                  size: 20,
                ),
                label: Text(
                  '인증하기',
                  style: Theme.of(context).textTheme.button,
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
      )
    );
  }
}
