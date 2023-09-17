import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:d2/features/auth/view_model/login_view_model.dart';
import 'package:d2/features/auth/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/log-in";
  static const routeName = "log-in";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onGoSignUpScreenTap() {
    context.pushNamed(SignUpScreen.routeName);
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState?.save();
        ref
            .read(loginProvider.notifier)
            .login(formData["email"]!, formData["password"]!, context);
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
                                    "Log in",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gaps.v16,
                          const Text(
                            "Forgot password?",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: _onGoSignUpScreenTap,
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
                                  "Create new account",
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
