import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
            vertical: Sizes.size16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What do you wand to see on Twitter?",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Sizes.size28,
                    ),
                  ),
                  Gaps.v14,
                  const Text(
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Sizes.size14,
                    ),
                  ),
                  Gaps.v60,
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var _ in [1, 2, 3, 4, 5, 6]) const Text("??")
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
