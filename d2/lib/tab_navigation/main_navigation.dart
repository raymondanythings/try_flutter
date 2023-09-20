import 'package:d2/constants/sizes.dart';
import 'package:d2/features/activity/activity_screen.dart';
import 'package:d2/features/feeds/views/feed_screen.dart';
import 'package:d2/features/feeds/views/widgets/write_feed.dart';

import 'package:d2/features/search/search_screen.dart';
import 'package:d2/features/users/views/users_profile_screen.dart';
import 'package:d2/tab_navigation/widgets/nav_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "mainNavigation";
  final String tab;
  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen>
    with SingleTickerProviderStateMixin {
  final _tabs = ["", "search", "activity", "profile"];

  late int _selectedIndex = _tabs.indexOf(widget.tab);
  late AnimationController _modalAnimateController;

  void _onTap(int index) {
    context.pushReplacement("/${_tabs[index]}");
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onWriteButtonTap() async {
    _modalAnimateController.reverse();
    await showModalBottomSheet(
      useSafeArea: false,
      context: context,
      isScrollControlled: true,
      // backgroundColor: Colors.transparent,
      builder: (context) => const FractionallySizedBox(
        heightFactor: 0.93,
        widthFactor: 1,
        child: WriteFeed(),
      ),
    );
    _modalAnimateController.forward();
  }

  @override
  void initState() {
    super.initState();
    _modalAnimateController = AnimationController(
      vsync: this,
      lowerBound: 0.9,
      upperBound: 1,
      value: 1,
      duration: const Duration(
        milliseconds: 150,
      ),
    );
  }

  @override
  void dispose() {
    _modalAnimateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _modalAnimateController,
      builder: (context, child) => Transform.scale(
        scale: _modalAnimateController.value,
        child: child,
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Sizes.size24,
            ),
          ),
        ),
        child: Scaffold(
          body: Stack(
            children: [
              Offstage(
                offstage: _selectedIndex != 0,
                child: const FeedScreen(),
              ),
              Offstage(
                offstage: _selectedIndex != 1,
                child: const SearchScreen(),
              ),
              Offstage(
                offstage: _selectedIndex != 2,
                child: const ActivityScreen(),
              ),
              Offstage(
                offstage: _selectedIndex != 3,
                child: const UserProfileSCreen(),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  isSelected: _selectedIndex == 0,
                  icon: FontAwesomeIcons.house,
                  selectedIcon: FontAwesomeIcons.house,
                  onTap: () => _onTap(0),
                ),
                NavTab(
                  isSelected: _selectedIndex == 1,
                  icon: FontAwesomeIcons.magnifyingGlass,
                  selectedIcon: FontAwesomeIcons.magnifyingGlass,
                  onTap: () => _onTap(1),
                ),
                NavTab(
                  isSelected: _selectedIndex == 4,
                  icon: FontAwesomeIcons.penToSquare,
                  selectedIcon: FontAwesomeIcons.solidPenToSquare,
                  onTap: _onWriteButtonTap,
                ),
                NavTab(
                  isSelected: _selectedIndex == 2,
                  icon: FontAwesomeIcons.heart,
                  selectedIcon: FontAwesomeIcons.solidHeart,
                  onTap: () => _onTap(2),
                ),
                NavTab(
                  isSelected: _selectedIndex == 3,
                  icon: FontAwesomeIcons.user,
                  selectedIcon: FontAwesomeIcons.solidUser,
                  onTap: () => _onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
