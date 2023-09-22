import 'package:d2/common/constants/breakpoint.dart';
import 'package:d2/constants/sizes.dart';

import 'package:d2/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliverPersistentSearchBar extends SliverPersistentHeaderDelegate {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onSuffixTap;
  final TextEditingController? controller;

  SliverPersistentSearchBar({
    this.onChanged,
    this.onSubmitted,
    this.onSuffixTap,
    this.controller,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: Breakpoints.sm,
      ),
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size10,
          vertical: Sizes.size10,
        ),
        child: CupertinoSearchTextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onSuffixTap: onSuffixTap,
          suffixIcon: const Icon(FontAwesomeIcons.paperPlane),
          suffixMode: OverlayVisibilityMode.always,
          style: TextStyle(
            color: isDarkMode(context) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
