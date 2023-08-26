import 'package:d1/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategorySelect extends StatelessWidget {
  final String text;
  final bool selected;
  final Function()? onTap;
  const CategorySelect({
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
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
          horizontal: Sizes.size14,
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
          borderRadius: BorderRadiusDirectional.circular(
            999,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selected ? Colors.white : Colors.black87,
            fontSize: Sizes.size14,
          ),
        ),
      ),
    );
  }
}
