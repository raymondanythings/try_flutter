import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:d1/features/auth/experience_screen.dart';
import 'package:d1/features/auth/landing_screen.dart';
import 'package:d1/features/auth/widgets/auth_button.dart';
import 'package:d1/features/auth/widgets/form_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _birthdayController = TextEditingController();
  String _name = "";
  String _email = "";
  bool _showDatePicker = false;
  bool _isFormValid = false;
  final DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  void _onTapBackButton(context) {
    Navigator.of(context).pop();
  }

  void _onConfirm() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LandingScreen(),
      ),
      (route) => false,
    );
  }

  void _onNextTap() {
    _showDatePicker = false;
    FocusScope.of(context).unfocus();
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            builder: (context) => const ExperienceScreen(),
          ),
        )
        .then(_onFormVaild);
  }

  void _onFormVaild(dynamic value) {
    _isFormValid = !!value;
    setState(() {});
  }

  void _toggleDatePicker(bool focused) {
    _showDatePicker = focused;
    setState(() {});
  }

  void _setTextFieldDate(DateTime date) {
    _birthdayController.value = TextEditingValue(text: dateFormat.format(date));
  }

  @override
  void initState() {
    super.initState();

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
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
          padding: _isFormValid
              ? const EdgeInsets.symmetric(
                  horizontal: Sizes.size20,
                )
              : const EdgeInsets.only(
                  right: Sizes.size10,
                ),
          child: _isFormValid
              ? Column(
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
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _onTapBackButton(context),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create your account",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: Sizes.size28,
                      ),
                    ),
                    TextField(
                      controller: _nameController,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        labelText: "Name",
                        suffix: FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color:
                              _name.isEmpty ? Colors.transparent : Colors.green,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    Gaps.v20,
                    TextField(
                      controller: _emailController,
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        labelText: "Phone number or email address",
                        floatingLabelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        suffix: FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: _email.isEmpty
                              ? Colors.transparent
                              : Colors.green,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    Gaps.v20,
                    Focus(
                      onFocusChange: _toggleDatePicker,
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: Sizes.size10,
                        ),
                        child: TextField(
                          readOnly: true,
                          controller: _birthdayController,
                          cursorColor: Theme.of(context).primaryColor,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          decoration: InputDecoration(
                            hintText: "Date of birth",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            suffix: FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: !_isFormValid
                                  ? Colors.transparent
                                  : Colors.green,
                            ),
                            disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    _showDatePicker
                        ? const Text(
                            "This will not be shown publicly. Confirm your own age, even if this account is for a\nbusiness, a pet, or something else.",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              height: 1.2,
                              color: Colors.black87,
                            ),
                          )
                        : Container(),
                  ],
                ),
                _isFormValid
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "By signing up, you agree to the ",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: Sizes.size14,
                              ),
                              children: [
                                TextSpan(
                                  text: "Terms of Service\n",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text: "and ",
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text: ", including ",
                                ),
                                TextSpan(
                                  text: "Cookie Use",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your\n account secure and personalizing our services,\nincluding ads. ",
                                ),
                                TextSpan(
                                  text: "Learn more",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                const TextSpan(
                                  text:
                                      "Others will be able to\nfind you by email or phone number, when provided,\nunless you choose otherwise ",
                                ),
                                TextSpan(
                                  text: "here.",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.v16,
                          GestureDetector(
                            onTap: _onConfirm,
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: Container(
                                padding: const EdgeInsets.all(
                                  Sizes.size14,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(999),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: Sizes.size16 + Sizes.size2,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FormButton(
                            disabled: _name.isEmpty || _email.isEmpty,
                            onTap: _onNextTap,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _showDatePicker
          ? BottomAppBar(
              height: 300,
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: SizedBox(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: _setTextFieldDate,
                  initialDateTime: DateTime(
                    DateTime.now().year - 1,
                  ),
                  maximumDate: DateTime.now(),
                ),
              ),
            )
          : null,
    );
  }
}
