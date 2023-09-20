import 'package:d2/constants/sizes.dart';
import 'package:flutter/material.dart';

enum Direction { top, bottom }

class SheetButton extends StatelessWidget {
  final String text;
  final Direction direction;
  final Color? color;
  const SheetButton({
    super.key,
    required this.text,
    required this.direction,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: direction == Direction.top
            ? const BorderRadius.only(
                topLeft: Radius.circular(
                  Sizes.size10,
                ),
                topRight: Radius.circular(
                  Sizes.size10,
                ),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(
                  Sizes.size10,
                ),
                bottomRight: Radius.circular(
                  Sizes.size10,
                ),
              ),
      ),
      padding: const EdgeInsets.all(
        Sizes.size16,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color ?? Colors.black,
        ),
      ),
    );
  }
}
