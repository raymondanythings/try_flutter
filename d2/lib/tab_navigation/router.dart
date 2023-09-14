import 'package:d2/features/settings/privacy_screen.dart';
import 'package:d2/features/settings/setting_screen.dart';
import 'package:d2/tab_navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: MainNavigationScreen(
            tab: "",
          ),
        );
      },
    ),
    GoRoute(
      path: "/search",
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: MainNavigationScreen(
            tab: "search",
          ),
        );
      },
    ),
    GoRoute(
      path: "/activity",
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: MainNavigationScreen(
            tab: "activity",
          ),
        );
      },
    ),
    GoRoute(
      path: "/profile",
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: MainNavigationScreen(
            tab: "profile",
          ),
        );
      },
    ),
    GoRoute(
      path: "/settings",
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: SettingsScreen(),
        );
      },
      routes: [
        GoRoute(
          path: "privacy",
          builder: (context, state) {
            return const PrivacyScreen();
          },
        ),
      ],
    ),
  ],
);
