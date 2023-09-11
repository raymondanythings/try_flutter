import 'package:d2/tab_navigation/main_navigation.dart';
import 'package:d2/tab_navigation/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Threads',
      theme: ThemeData(
        textTheme: Typography.blackCupertino,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        splashColor: Colors.transparent,
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: Typography.whiteCupertino,
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(
          0xFF111111,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(
            0xFF111111,
          ),
          surfaceTintColor: Color(
            0xFF111111,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStatePropertyAll(
              Colors.white,
            ),
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Color(
            0xFF111111,
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
