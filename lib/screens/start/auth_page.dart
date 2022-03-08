import 'package:dooramgi/constants/common_size.dart';
import 'package:dooramgi/states/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

  const auth_duration = Duration(milliseconds: 200);

class _AuthPageState extends State<AuthPage> {
  TextEditingController _phoneNumberController = TextEditingController(
    text:'010'
  );

  TextEditingController _codeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  VerificationsStatus _verificationsStatus = VerificationsStatus.none;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _verificationsStatus == VerificationsStatus.verifying,
      child: Form(
        key: _formKey,
        child: Scaffold(
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
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      MaskedInputFormatter("000 0000 0000"),
                    ],
                    validator: (phoneNumber){
                      if (phoneNumber != null && phoneNumber.length == 13) {
                        return null;
                      } else {
                        //error 부분
                        return '전화번호 똑바로 입력해라..';
                      }
                    },
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
                    if(_formKey.currentState != null) {
                      bool passed = _formKey.currentState!.validate();
                      if (passed) {
                        setState(() {
                          _verificationsStatus = VerificationsStatus.codeSent;
                        });
                      }
                    }
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
                  AnimatedOpacity(
                    duration: auth_duration,
                    opacity: (_verificationsStatus == VerificationsStatus.none?0:1),
                    child: AnimatedContainer(
                      duration: auth_duration,
                      curve: Curves.easeInOut,
                      height: getVerificationHeight(_verificationsStatus),
                      child: TextFormField(
                        controller: _codeController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          MaskedInputFormatter("000000"),
                        ],
                        decoration: const InputDecoration(
                            // prefixIcon: Icon(
                            //     Icons.phone
                            // ),
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
                    ),
                  ),
                  AnimatedContainer(
                    duration: auth_duration,
                    curve: Curves.easeInOut,
                    height: getVerificationButtonHeight(_verificationsStatus),
                    child: TextButton(onPressed: () {
                      attemptVerify();
                    },
                      child: (_verificationsStatus == VerificationsStatus.verifying)?
                      CircularProgressIndicator(
                        color: Colors.white,
                      ):
                      Text(
                        '인증하기',
                        style: Theme.of(context).textTheme.button,
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
          )
        ),
      ),
    );
  }

  double getVerificationHeight(VerificationsStatus status) {
    switch(status) {
      case VerificationsStatus.none:
        return 0;
      case VerificationsStatus.codeSent:
      case VerificationsStatus.verifying:
      case VerificationsStatus.verificationDone:
        return 60 + common_small_padding;
    }
  }

  double getVerificationButtonHeight(VerificationsStatus status) {
    switch(status) {
      case VerificationsStatus.none:
        return 0;
      case VerificationsStatus.codeSent:
      case VerificationsStatus.verifying:
      case VerificationsStatus.verificationDone:
        return 48;
    }
  }

  void attemptVerify() async {
   setState(() {
     _verificationsStatus = VerificationsStatus.verifying;
   });

   await Future.delayed(Duration(milliseconds: 1000));

   setState(() {
     _verificationsStatus = VerificationsStatus.verificationDone;
   });

   context.read<UserProvider>().setUserAuth(true);
  }
}

enum VerificationsStatus{
  none, codeSent, verifying, verificationDone
}