import 'package:d2/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  const Avatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(
            imageUrl,
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