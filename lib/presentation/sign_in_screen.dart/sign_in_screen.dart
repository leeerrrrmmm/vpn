import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn/components/build_button.dart';
import 'package:vpn/components/build_img.dart';
import 'package:vpn/components/build_text.dart';
import 'package:vpn/presentation/forgot/forgot_screen.dart';
import 'package:vpn/presentation/sign_up_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool obscureText = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(height: 32),
                  BuildImage(imgPath: 'assets/images/sLogo.png'),
                  const SizedBox(height: 40),
                  Center(
                    child: BuildText(
                      textAlign: TextAlign.center,
                      text:
                          'Sign up now to access faster internet\nin more than 120+ locations.',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

              SingleChildScrollView(
                child: Form(
                  key: _globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),

                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      _textFormField(
                        controller: _emailController,
                        text: 'Email',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        autofillHint: AutofillHints.email,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      _textFormField(
                        controller: _passwordController,
                        text: 'Password',
                        icon: Icons.lock,
                        autofillHint: AutofillHints.password,
                        textInputAction: TextInputAction.done,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap:
                                () => Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => ForgotScreen(),
                                  ),
                                ),
                            child: BuildText(
                              text: 'Forgot password?',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      BuildButton(
                        btnText: 'Sign Up',
                        btnColor: const Color(0xff0CBC8B),
                        textColor: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        onTap: () {
                          if (_globalKey.currentState!.validate()) {
                            log('Name: ${_nameController.text}');
                            log('Email: ${_emailController.text}');
                            log('Password: ${_passwordController.text}');
                          }
                        },
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BuildText(
                            text: "Don't have an Account?",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                            onTap:
                                () => Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                ),
                            child: BuildText(
                              text: " Sign Up",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _textFormField({
    required TextEditingController controller,
    required String text,
    required IconData icon,
    String? autofillHint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
  }) {
    final isPassword = text == 'Password';

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: isPassword ? obscureText : false,
      autofillHints: autofillHint != null ? [autofillHint] : null,
      validator: (value) {
        if (value == null || value.isEmpty) return '$text cannot be empty';
        if (text == 'Email' && !value.contains('@')) return 'Invalid email';
        if (text == 'Password' && value.length < 6) return 'Password too short';
        return null;
      },
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        suffixIcon:
            isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
                : null,
        filled: true,
        fillColor: const Color(0xFF979797).withValues(alpha: 0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
