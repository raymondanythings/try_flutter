import 'package:d2/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReportReasonItem extends StatelessWidget {
  final String text;
  const ReportReasonItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      padding: const EdgeInsets.all(
        Sizes.size16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: Sizes.size16,
            ),
          ),
          FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.grey.shade400,
            size: Sizes.size20,
          )
        ],
      ),
    );
  }
}
