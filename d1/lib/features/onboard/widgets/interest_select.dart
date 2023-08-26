import 'package:d1/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterestSelect extends StatelessWidget {
  final String text;
  final bool selected;
  final Function()? onTap;
  const InterestSelect({
    super.key,
    required this.text,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 100,
        ),
        padding: const EdgeInsets.all(
          Sizes.size10,
        ),
        decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor : Colors.white,
          border: Border.all(
            color: !selected
                ? Colors.black.withOpacity(
                    0.2,
                  )
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FaIcon(
                  FontAwesomeIcons.solidCircleCheck,
                  color: Colors.white,
                  size: Sizes.size20,
                )
              ],
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : Colors.black87,
                fontSize: Sizes.size16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
