import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size2,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      child: ListTile(
        leading: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(
                "https://source.unsplash.com/random/128x128/?avatar_mail",
              ),
            ),
          ],
        ),
        title: const Row(
          children: [
            Text(
              "rjmithun",
              style: TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Gaps.h2,
                Image(
                  width: Sizes.size20,
                  height: Sizes.size20,
                  image: AssetImage('assets/verified.png'),
                ),
              ],
            )
          ],
        ),
        subtitle: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Opacity(
              opacity: 0.5,
              child: Text(
                "Mithun",
              ),
            ),
            Gaps.v10,
            Opacity(
              opacity: 0.7,
              child: Text(
                "26.6K followers",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size6,
                horizontal: Sizes.size20,
              ),
              child: const Text(
                "Follow",
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
