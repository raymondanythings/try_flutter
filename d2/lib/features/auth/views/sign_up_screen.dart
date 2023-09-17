import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/auth/view_model/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/signUp";
  static const routeName = "signUp";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onLoginTap(BuildContext context) {
    context.pop();
  }

  void _onSubmitTap() async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();

        ref
            .read(signUpProvider.notifier)
            .signUp(formData["email"]!, formData["password"]!, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          backgroundColor: const Color(
            0xffF6FAF9,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Form(
                key: _formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/threads_login.png',
                          width: Sizes.size64,
                          height: Sizes.size64,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                color: Colors.blue,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Mobile number or email",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: Sizes.size1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: Sizes.size1,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Plase write your email";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                formData['email'] = newValue;
                              }
                            },
                          ),
                          Gaps.v16,
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: Sizes.size1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: Sizes.size1,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "Plase write your password";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              if (newValue != null) {
                                formData['password'] = newValue;
                              }
                            },
                          ),
                          Gaps.v16,
                          GestureDetector(
                            onTap: _onSubmitTap,
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: Sizes.size24,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size5,
                                  ),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(
                                    milliseconds: 100,
                                  ),
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  child: const Text(
                                    "Create new Account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () => _onLoginTap(context),
                          child: FractionallySizedBox(
                            widthFactor: 1,
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 100,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Sizes.size5,
                                ),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(
                                  milliseconds: 100,
                                ),
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600,
                                ),
                                child: const Text(
                                  "Log in",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
