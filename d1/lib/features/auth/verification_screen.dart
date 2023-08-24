import 'dart:async';

import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:d1/features/auth/password_screen.dart';
import 'package:d1/features/auth/widgets/form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  final String email;
  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _codeController = TextEditingController();

  bool _isValid = false;
  bool _isLoading = false;
  bool _isConfirm = false;

  void _onConfirmCode() {
    setState(() {
      _isLoading = true;
    });
    Timer.periodic(
      const Duration(
        seconds: 3,
      ),
      (timer) {
        timer.cancel();
        _onMovePasswordScreen();
      },
    );
  }

  void _onMovePasswordScreen() {
    setState(
      () {
        _isConfirm = true;
      },
    );
    Timer.periodic(
      const Duration(
        seconds: 1,
      ),
      (timer) {
        timer.cancel();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const PasswordScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  void _onChangeCode() {
    setState(() {
      var codeValid = _codeController.text.length == 6;
      if (codeValid != _isValid) _isValid = codeValid;
    });
  }

  @override
  void initState() {
    super.initState();
    _codeController.addListener(_onChangeCode);
  }

  @override
  void dispose() {
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
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => {},
                child: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 100,
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
                          "We sent you a code",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Sizes.size28,
                          ),
                        ),
                        Gaps.v14,
                        Text(
                          "Enter it below to verify\n${widget.email}.",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: Sizes.size14,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        PinCodeTextField(
                          appContext: context,
                          length: 6,
                          cursorColor: Colors.transparent,
                          pinTheme: PinTheme(
                            selectedColor: Colors.black,
                            inactiveColor: Colors.grey.shade400,
                            activeColor: Colors.grey.shade400,
                          ),
                          keyboardType: TextInputType.number,
                          controller: _codeController,
                        ),
                        AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color:
                                !_isConfirm ? Colors.transparent : Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Did't receive email?",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Gaps.v14,
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: FormButton(
                            text: _isLoading
                                ? const CupertinoActivityIndicator(
                                    color: Colors.white,
                                  )
                                : const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: Sizes.size2,
                                    ),
                                    child: Text(
                                      "Next",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size20,
                            ),
                            onTap: !_isLoading ? _onConfirmCode : () {},
                            disabled: !_isValid,
                          ),
                        ),
                      ],
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
