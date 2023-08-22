import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:d1/features/auth/sign_up_screen.dart';
import 'package:d1/features/auth/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(
          FontAwesomeIcons.twitter,
          color: Theme.of(context).primaryColor,
          size: Sizes.size32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size32),
          child: Column(
            children: [
              const Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "See what's happening in the world right now.",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: Sizes.size28 + Sizes.size3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        AuthButton(
                          text: "Continue with Google",
                          icon: FaIcon(
                            FontAwesomeIcons.google,
                            size: Sizes.size24,
                          ),
                        ),
                        Gaps.v14,
                        AuthButton(
                          text: "Continue with Apple",
                          icon: FaIcon(
                            FontAwesomeIcons.apple,
                            size: Sizes.size28,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Sizes.size14,
                        ),
                        child: Divider(
                          color: Colors.grey.shade300,
                          height: 36,
                        )),
                  ),
                  const Text(
                    "or",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Sizes.size12,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: Sizes.size14,
                        ),
                        child: Divider(
                          color: Colors.grey.shade300,
                          height: 36,
                        )),
                  ),
                ],
              ),
              Flexible(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthButton(
                    onTap: () => _onCreateAccountTap(context),
                    text: "Create account",
                    isInverse: true,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "By signing up, you agree to our",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Terms,",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const Text(
                            ", and ",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            "Cookie Use",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const Text(
                            ".",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Have an account already?",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Colors.black54,
                            ),
                          ),
                          Gaps.h10,
                          Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
