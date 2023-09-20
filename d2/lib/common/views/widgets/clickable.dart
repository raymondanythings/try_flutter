import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  final bool disabled;
  final Widget child;
  final Function()? onTap;
  const Clickable({
    super.key,
    this.disabled = false,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !disabled ? onTap : () {},
      child: AnimatedOpacity(
        opacity: !disabled ? 1 : 0.6,
        duration: const Duration(
          milliseconds: 200,
        ),
        child: child,
      ),
    );
  }
}
