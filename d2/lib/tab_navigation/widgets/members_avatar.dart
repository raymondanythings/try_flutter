import 'package:d2/constants/sizes.dart';
import 'package:flutter/material.dart';

class MembersAvatar extends StatelessWidget {
  const MembersAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: Sizes.size40,
      height: Sizes.size40,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: -Sizes.size2,
            child: CircleAvatar(
              radius: Sizes.size12,
              foregroundImage: NetworkImage(
                "https://source.unsplash.com/random/128x128/?avatar_mail",
              ),
            ),
          ),
          Positioned(
            left: -Sizes.size4,
            child: CircleAvatar(
              radius: Sizes.size10,
              foregroundImage: NetworkImage(
                "https://source.unsplash.com/random/128x128/?indian",
              ),
            ),
          ),
          Positioned(
            bottom: -Sizes.size4,
            child: CircleAvatar(
              radius: Sizes.size8,
              foregroundImage: NetworkImage(
                "https://source.unsplash.com/random/128x128/?claver",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
