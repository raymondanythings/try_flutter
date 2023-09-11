import 'package:d2/features/settings/privacy_screen.dart';
import 'package:d2/features/settings/setting_screen.dart';
import 'package:d2/tab_navigation/main_navigation.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const MainNavigationScreen(
          tab: "",
        );
      },
    ),
    GoRoute(
      path: "/search",
      builder: (context, state) {
        return const MainNavigationScreen(
          tab: "search",
        );
      },
    ),
    GoRoute(
      path: "/activity",
      builder: (context, state) {
        return const MainNavigationScreen(
          tab: "activity",
        );
      },
    ),
    GoRoute(
      path: "/profile",
      builder: (context, state) {
        return const MainNavigationScreen(
          tab: "profile",
        );
      },
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) {
        return const SettingsScreen();
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
// routes: [
      //   GoRoute(
      //     path: ":tab(home|search|activity|profile)",
      //     builder: (context, state) {
      //       final tab = state.params["tab"]!;
      // return MainNavigationScreen(
      //   tab: tab,
      // );
      //     },
      //     routes: [
      //       GoRoute(
      //         path: "settings",
      //         name: "settings",
      //         builder: (context, state) => const SettingsScreen(),
      //       ),
      //     ],
      //   ),
      // ],