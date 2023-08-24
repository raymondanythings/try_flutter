import 'package:d1/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    this.onTap,
    this.padding,
    this.text,
  });
  final Function()? onTap;
  final bool disabled;
  final EdgeInsetsGeometry? padding;
  final Widget? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (!disabled) {onTap?.call()}
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 100,
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size20,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            999,
          ),
          color: disabled ? Colors.grey.shade300 : Colors.black,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(
            milliseconds: 100,
          ),
          style: TextStyle(
            color: disabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          child: text ??
              const Text(
                "Next",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
        ),
      ),
    );
  }
}
