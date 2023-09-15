import 'dart:async';

import 'package:d2/common/view_models/platform_theme_vm.dart';
import 'package:d2/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _isLoading = false;

  void _popNavigation() {
    context.pop();
  }

  void _onLogout() {
    _popNavigation();
    setState(() {
      _isLoading = true;
    });
    Timer.periodic(
      const Duration(
        seconds: 3,
      ),
      (timer) {
        timer.cancel();
        setState(() {
          _isLoading = false;
          _popNavigation();
        });
      },
    );
  }

  void _onLogoutTap() async {
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Are you sure?"),
        actions: [
          CupertinoDialogAction(
            onPressed: _popNavigation,
            child: const Text("No"),
          ),
          CupertinoDialogAction(
            onPressed: _onLogout,
            isDestructiveAction: true,
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(platformThemeProvider).isDarkMode;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: AppBar(
            centerTitle: true,
            title: const Text(
              'Settings',
              style: TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Center(
                child: Wrap(
                  spacing: Sizes.size4,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      size: Sizes.size20,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                          fontSize: Sizes.size16,
                          color: isDark ? Colors.white : null),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: isDark,
            onChanged: (value) {
              ref.read(platformThemeProvider.notifier).setTheme(value);
            },
            title: const Text(
              "Enable Dark Mode",
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.userPlus,
            ),
            title: Text(
              "Follow and invite friends",
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.bell,
            ),
            title: Text(
              "Notifications",
            ),
          ),
          GestureDetector(
            onTap: () => context.push("/settings/privacy"),
            child: const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.userLock,
              ),
              title: Text(
                "Privacy",
              ),
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleUser,
            ),
            title: Text(
              "Account",
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.lifeRing,
            ),
            title: Text(
              "Help",
            ),
          ),
          const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.circleInfo,
            ),
            title: Text(
              "About",
            ),
          ),
          GestureDetector(
            onTap: _onLogoutTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  Sizes.size14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Log out",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.blue,
                      ),
                    ),
                    Container(
                      child: _isLoading
                          ? const CircularProgressIndicator.adaptive()
                          : Container(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
