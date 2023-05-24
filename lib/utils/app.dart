import 'package:flutter/material.dart';

import 'app_router.dart';

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Account Demo',
      theme: ThemeData(
        primarySwatch: _buildPrimaryColor(),
      ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}

_buildPrimaryColor() {
  return MaterialColor(
    const Color(0xFF76C043).value,
    const <int, Color>{
      50: Color.fromRGBO(118, 192, 67, .1),
      100: Color.fromRGBO(118, 192, 67, .2),
      200: Color.fromRGBO(118, 192, 67, .3),
      300: Color.fromRGBO(118, 192, 67, .4),
      400: Color.fromRGBO(118, 192, 67, .5),
      500: Color.fromRGBO(118, 192, 67, .6),
      600: Color.fromRGBO(118, 192, 67, .7),
      700: Color.fromRGBO(118, 192, 67, .8),
      800: Color.fromRGBO(118, 192, 67, .9),
      900: Color.fromRGBO(118, 192, 67, 1),
    },
  );
}
