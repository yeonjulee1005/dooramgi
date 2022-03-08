import 'package:dio/dio.dart';
import 'package:dooramgi/constants/common_size.dart';
import 'package:dooramgi/states/user_provider.dart';
import 'package:dooramgi/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  PageController controller;
  IntroPage(this.controller, {Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    logger.d('current user state: ${context.read<UserProvider>().userState}');
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(common_padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('인트로페이지'),
            TextButton(
                onPressed: () async {
                  widget.controller.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease
                  );
                  getPermissionLocation();
                  //http 사용방법 dio
                  // var response = await Dio().get('https://randomuser.me/api/');
                  // logger.d(response);
                },
                child: Text('회원가입하고 시작하기'))
          ],
        ),
      ),
    );
  }

  void getPermissionLocation () async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    loggers(_locationData);
  }

  void loggers (_locationData) {
    logger.d(_locationData);
  }
}