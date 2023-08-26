import 'package:d1/constants/Categories.dart';
import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:d1/features/auth/widgets/form_button.dart';
import 'package:d1/features/onboard/widgets/category_select.dart';
import 'package:d1/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Map<String, List<String>> selectedList = {};

  void _onCategoryTap(String key, String category) {
    setState(() {
      bool selected = selectedList[key]!.contains(category);
      selected
          ? selectedList[key]!.remove(category)
          : selectedList[key]!.add(category);
    });
  }

  @override
  void initState() {
    super.initState();
    for (var category in Categories.data.keys) {
      selectedList[category] = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size32,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size40,
                vertical: Sizes.size16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What do you wand to see on Twitter?",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Sizes.size28,
                    ),
                  ),
                  Gaps.v14,
                  Text(
                    "Interests are used to personalize your\nexperience and will be visible on your profile.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v8,
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      for (var key in Categories.data.keys)
                        Container(
                          decoration: BoxDecoration(
                            border: Categories.data.keys.last == key
                                ? const Border()
                                : Border(
                                    bottom: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size14,
                            vertical: Sizes.size24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                key.toTitleCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: Sizes.size24,
                                ),
                              ),
                              Gaps.v32,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 10,
                                  direction: Axis.vertical,
                                  children: [
                                    if (Categories.data[key] != null)
                                      for (var i = 0; i < 3; i++)
                                        Wrap(
                                          spacing: 10,
                                          children: [
                                            for (var category in Categories
                                                .data[key]!
                                                .sublist(
                                                    (i *
                                                            Categories
                                                                .data[key]!
                                                                .length /
                                                            3)
                                                        .round(),
                                                    ((i + 1) *
                                                            Categories
                                                                .data[key]!
                                                                .length /
                                                            3)
                                                        .round()))
                                              CategorySelect(
                                                text: category.toString(),
                                                onTap: () {
                                                  _onCategoryTap(key, category);
                                                },
                                                selected: selectedList[key]!
                                                    .contains(category),
                                              )
                                          ],
                                        )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black.withOpacity(
                0.2,
              ),
            ),
          ),
        ),
        child: const BottomAppBar(
            elevation: 1,
            height: 80,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FormButton(
                    disabled: false,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
