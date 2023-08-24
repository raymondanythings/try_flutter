import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:d1/features/auth/widgets/form_button.dart';
import 'package:d1/features/onboard/interests_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordConfirm = false;
  bool _obsecureText = true;
  void _onChangePassword() {
    setState(() {
      _isPasswordConfirm = _passwordController.text.length >= 8;
    });
  }

  void _toggleObsecureText() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  void _onNextTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const InterestsScreen()),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onChangePassword);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
            vertical: Sizes.size16,
          ),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "You'll need a password",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Sizes.size28,
                          ),
                        ),
                        Gaps.v14,
                        const Text(
                          "Make sure it's 8 characters or more.",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        Gaps.v60,
                        TextField(
                          controller: _passwordController,
                          obscureText: _obsecureText,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: _toggleObsecureText,
                                  child: FaIcon(
                                    _obsecureText
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeLowVision,
                                    color: Colors.grey.shade500,
                                    size: Sizes.size20,
                                  ),
                                ),
                                Gaps.h14,
                                _isPasswordConfirm
                                    ? const FaIcon(
                                        FontAwesomeIcons.solidCircleCheck,
                                        color: Colors.green,
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: FormButton(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size20,
                        ),
                        onTap: _onNextTap,
                        disabled: !_isPasswordConfirm,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
