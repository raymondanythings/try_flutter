import 'package:d2/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const CircleAvatar(
          foregroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1693336430952-2ff5b03b216a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
          ),
        ),
        Positioned(
          bottom: -Sizes.size10,
          right: -Sizes.size10,
          child: Container(
            padding: const EdgeInsets.all(
              Sizes.size2 + Sizes.size1,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  999,
                ),
              ),
            ),
            child: const FaIcon(
              FontAwesomeIcons.circlePlus,
              size: Sizes.size20,
            ),
          ),
        )
      ],
    );
  }
}
