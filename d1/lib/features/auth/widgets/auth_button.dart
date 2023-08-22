import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;
  final bool isInverse;

  final Function()? onTap;

  const AuthButton({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.isInverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(
            Sizes.size14,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(999),
            ),
            color: isInverse ? Colors.black : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon.toString().isEmpty
                  ? Container()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: icon,
                    ),
              Gaps.h14,
              Text(
                text,
                style: TextStyle(
                  fontSize: Sizes.size16 + Sizes.size2,
                  fontWeight: FontWeight.w700,
                  color: isInverse ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
