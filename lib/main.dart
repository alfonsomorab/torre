import 'package:flutter/material.dart';

import 'package:torre/src/pages/home_page.dart';
import 'package:torre/src/pages/splash_screen_page.dart';
import 'package:torre/src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Torre',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      initialRoute: 'home',
      routes: {
        '/' : ( BuildContext context ) => SplashScreen(),
        'home' : ( BuildContext context ) => HomePage(),
      },
    );
  }
}