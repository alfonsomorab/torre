import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:torre/src/pages/home_page.dart';
import 'package:torre/src/pages/splash_screen_page.dart';
import 'package:torre/src/services/people_service.dart';
import 'package:torre/src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (_) => new PeopleService() ),
      ],
      child: MaterialApp(
        title: 'Torre',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        initialRoute: '/',
        routes: {
          '/' : ( BuildContext context ) => SplashScreen(),
          'home' : ( BuildContext context ) => HomePage(),
        },
      ),
    );
  }
}