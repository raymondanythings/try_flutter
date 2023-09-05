import 'package:d2/constants/sizes.dart';
import 'package:d2/features/search/widgets/search_tile.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

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
        bottom: const PreferredSize(
          preferredSize: Size(
            0,
            40,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            child: CupertinoSearchTextField(),
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
