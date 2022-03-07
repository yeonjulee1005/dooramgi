import 'package:beamer/beamer.dart';
import 'package:dooramgi/router/locations.dart';
import 'package:dooramgi/screens/splash_screen.dart';
import 'package:dooramgi/screens/start_screen.dart';
import 'package:dooramgi/utils/logger.dart';
import 'package:flutter/material.dart';

final _routerDelegate = BeamerDelegate(
  guards: [
    BeamGuard(
        pathBlueprints: ['/'],
        check: (context, location){
          return false;
        }, showPage: BeamPage(child: StartScreen()
    )
    )
  ],
    locationBuilder: BeamerLocationBuilder(
        beamLocations: [
          HomeLocation()
        ]
    )
);

void main() {
  logger.d('open Applications');
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
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
            button: TextStyle(color: Colors.white)
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                backgroundColor: Color(0xFF174378),
                primary: Colors.white,
                minimumSize: Size.fromHeight(40)
            )
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontFamily: 'Pretendard',
            color: Colors.black54
          )
        ),
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}
