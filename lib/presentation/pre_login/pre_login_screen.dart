import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vpn/components/build_button.dart';
import 'package:vpn/components/build_img.dart';
import 'package:vpn/components/build_text.dart';
import 'package:vpn/presentation/anim.dart';

class PreLogin extends StatelessWidget {
  const PreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // TOP logo & text
              Column(
                children: [
                  BuildImage(imgPath: 'assets/images/sLogo.png'),
                  const SizedBox(height: 63),
                  BuildText(
                    text:
                        'Login now to access faster internet\nmore than 120+ location.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // BOTTOM btn and sign in
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    BuildButton(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (_, __, ___) =>
                                    const SignUpAnimatedTransitionScreen(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },

                      icon: Icons.mail,
                      btnText: 'Sign up With Email',
                      activeBorder: true,
                      backgroundIconColor: Colors.black,
                      iconColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: BuildButton(
                        btnText: 'Sign up With Facebook',
                        btnColor: Color(0xff367cff),
                        icon: FontAwesomeIcons.facebook,
                        iconColor: Colors.white,
                        backgroundIconColor: Color(0xff367cff),
                        textColor: Colors.white,
                      ),
                    ),
                    BuildButton(
                      icon: FontAwesomeIcons.google,
                      btnText: 'Sign up With Google',
                      activeBorder: true,
                      backgroundIconColor: Colors.black,
                      iconColor: Colors.white,
                    ),
                    const SizedBox(height: 30),
                    // Don't have an account?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildText(
                          text: "Don't have an account?",
                          fontWeight: FontWeight.w500,
                        ),
                        BuildText(
                          text: " Sign In",
                          fontWeight: FontWeight.bold,
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
