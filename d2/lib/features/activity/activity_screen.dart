import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/activity/features/activity_card.dart';

import 'package:flutter/material.dart';

final tabs = ["Top", "Users", "Videos", "Sounds", "LIVE", "Shopping", "Brands"];

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _selectedIndex = 0;

  void _onSelectTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Activity",
            style: TextStyle(
              fontSize: Sizes.size36,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            labelColor: Colors.white,
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: _onSelectTap,
            tabs: [
              for (var tab in tabs)
                AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 150,
                  ),
                  decoration: BoxDecoration(
                    color: tabs[_selectedIndex] == tab
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(Sizes.size10),
                    border: Border.all(
                      color: tabs[_selectedIndex] == tab
                          ? Colors.transparent
                          : Colors.grey.shade400,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size16,
                  ),
                  child: Tab(
                    text: tab,
                  ),
                ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
            vertical: Sizes.size8,
          ),
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) => const ListTile(
              leading: ActivityCard(),
              title: Row(
                children: [
                  Text(
                    "rjmithun",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Gaps.h2,
                  Text(
                    "2h",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  ),
                  Gaps.h2,
                  // Image(
                  //   width: Sizes.size20,
                  //   height: Sizes.size20,
                  //   image: AssetImage('assets/verified.png'),
                  // ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Mithun",
                    ),
                  ),
                  Gaps.v4,
                  Text(
                    "Here's a thread you should follow if you love botarny @jane_mobbin",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              // trailing: Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Container(
              //       decoration: BoxDecoration(
              //         border: Border.all(
              //           color: Colors.grey.shade300,
              //         ),
              //         borderRadius: BorderRadius.circular(
              //           Sizes.size8,
              //         ),
              //       ),
              //       padding: const EdgeInsets.symmetric(
              //         vertical: Sizes.size6,
              //         horizontal: Sizes.size20,
              //       ),
              //       child: const Text(
              //         "Follow",
              //         style: TextStyle(
              //           fontSize: Sizes.size14,
              //           color: Colors.black,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              isThreeLine: true,
            ),
          ),
        ),
      ),
    );
  }
}
