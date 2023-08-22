import 'package:d1/constants/gaps.dart';
import 'package:d1/constants/sizes.dart';
import 'package:d1/features/auth/widgets/form_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _name = "";
  String _email = "";

  void _onTapBackButton(context) {
    Navigator.of(context).pop();
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
    super.dispose();
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
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.only(
            right: Sizes.size10,
          ),
          child: Column(
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
            horizontal: Sizes.size32,
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
                        labelText: "Email",
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
                    TextField(
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      decoration: InputDecoration(
                        labelText: "Date of birth",
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FormButton(
                      disabled: _name.isEmpty || _email.isEmpty,
                      onTap: () => {print("OOKK")},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
