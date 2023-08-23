import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:d1/features/auth/widgets/form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceState();
}

class _ExperienceState extends State<ExperienceScreen> {
  void _onTapBackButton(context) {
    Navigator.of(context).pop();
  }

  void _onNextTap() {
    Navigator.of(context).pop(
      togglePolicy,
    );
  }

  bool togglePolicy = false;
  void _onTogglePolicy(bool toggle) {
    togglePolicy = toggle;
    setState(() {});
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
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _onTapBackButton(context),
                child: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
            vertical: Sizes.size16,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Customize your\nexperience",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: Sizes.size28,
                      ),
                    ),
                    Gaps.v20,
                    const Text(
                      "Track where you see Twitter\ncontent across the web",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: Sizes.size16 + Sizes.size2,
                      ),
                    ),
                    Gaps.v16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Twitter uses this data to\npersonalize your experience. This\nweb browsing history will never be\nstored with your name, email, or\nphone number.",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Sizes.size16,
                          ),
                        ),
                        CupertinoSwitch(
                          value: togglePolicy,
                          onChanged: _onTogglePolicy,
                        )
                      ],
                    ),
                    Gaps.v24,
                    RichText(
                      text: TextSpan(
                        text: "By signing up, you agree to our ",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: Sizes.size14,
                        ),
                        children: [
                          TextSpan(
                            text: "Terms",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(
                            text: ", ",
                          ),
                          TextSpan(
                            text: "Privacy\n",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: "Policy",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(
                            text: ", and ",
                          ),
                          TextSpan(
                            text: "Cookie Use",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const TextSpan(
                            text:
                                ". Twitter may use your\ncontact information, including your email address\nand phone number for purposes outlined in our\nPrivacy Policy. ",
                          ),
                          TextSpan(
                            text: "Learn more",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: FormButton(
                    onTap: _onNextTap,
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size20,
                    ),
                    disabled: !togglePolicy,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
