import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size14,
        vertical: Sizes.size14,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      Sizes.size10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(999),
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(
                        'assets/threads_logo.png',
                        fit: BoxFit.fill,
                        width: Sizes.size32,
                        height: Sizes.size32,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -Sizes.size6,
                    right: -Sizes.size6,
                    child: Container(
                      padding: const EdgeInsets.all(
                        Sizes.size4,
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
                      ),
                    ),
                  )
                ],
              ),
              const Text("1"),
            ],
          ),
          Gaps.h16,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "pubity",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.h2,
                      Image(
                        width: Sizes.size20,
                        image: AssetImage('assets/verified.png'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "2m",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Gaps.h24,
                      const FaIcon(
                        FontAwesomeIcons.ellipsis,
                      )
                    ],
                  )
                ],
              ),
              Gaps.v6,
              const Text(
                "Vine after seeing the Threads logo unveiled",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
