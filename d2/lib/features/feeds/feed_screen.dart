import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/feeds/widgets/feed.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size20,
          ),
          child: Column(
            children: [
              Image(
                width: Sizes.size52,
                image: AssetImage('assets/threads_logo.png'),
              ),
              Gaps.v32,
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
              Feed(),
            ],
          ),
        ),
      ),
    );
  }
}
