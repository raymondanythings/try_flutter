import 'package:d2/common/repositories/platform_theme_repository.dart';
import 'package:d2/common/view_models/platform_theme_vm.dart';
import 'package:d2/firebase_options.dart';
import 'package:d2/tab_navigation/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "Thread-raymond",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final preferences = await SharedPreferences.getInstance();
  final repository = PlatformThemeRepository(preferences);

  final isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  runApp(
    ProviderScope(
      overrides: [
        platformThemeProvider.overrideWith(
          () => PlatformThemeViewModel(
            repository,
            isDarkMode,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Threads',
      theme: ref.watch(platformThemeProvider).isDarkMode
          ? Theme.dark
          : Theme.light,
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
      routerConfig: ref.watch(router),
    );
  }
}

class Theme {
  static final ThemeData light = ThemeData(
    primaryColor: const Color(0xff0B63E0),
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
  );

  static final ThemeData dark = ThemeData(
    primaryColor: const Color(0xff0B63E0),
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
  );
}
