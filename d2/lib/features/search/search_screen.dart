import 'package:d2/common/view_models/platform_theme_vm.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/search/widgets/search_tile.dart';
import 'package:d2/utils.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(
            fontSize: Sizes.size36,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size(
            0,
            40,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            child: CupertinoSearchTextField(
              style: TextStyle(
                color: context.watch<PlatformThemeViewModel>().isDarkMode
                    ? Colors.white
                    : null,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
          vertical: Sizes.size8,
        ),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => const SearchTile(),
        ),
      ),
    );
  }
}
