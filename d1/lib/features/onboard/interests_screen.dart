import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:d1/features/auth/widgets/form_button.dart';
import 'package:d1/features/onboard/category_screen.dart';
import 'package:d1/features/onboard/widgets/interest_select.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

const maxSelectCount = 3;

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<String> selectedList = [];

  void _onInterestTap(int index) {
    var selected = !!selectedList.contains(interests[index]);
    if (selectedList.length == maxSelectCount && !selected) {
      return;
    } else {
      setState(
        () {
          selected
              ? selectedList.remove(interests[index])
              : selectedList.add(interests[index]);
        },
      );
    }
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CategoryScreen(),
      ),
    );
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
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
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
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      Sizes.size16,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.3,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: interests.length,
                      itemBuilder: (context, index) {
                        bool selected =
                            !!selectedList.contains(interests[index]);
                        return InterestSelect(
                          onTap: () {
                            _onInterestTap(index);
                          },
                          selected: selected,
                          text: interests[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
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
        child: BottomAppBar(
            elevation: 1,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedList.length == maxSelectCount
                      ? const Text("Great work 🎉")
                      : Text(
                          "${selectedList.length} of $maxSelectCount selected"),
                  FormButton(
                    disabled: selectedList.length != maxSelectCount,
                    onTap: _onNextTap,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
