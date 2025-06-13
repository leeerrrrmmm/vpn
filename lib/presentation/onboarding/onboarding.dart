import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn/components/build_button.dart';
import 'package:vpn/components/build_img.dart';
import 'package:vpn/components/build_text.dart';
import 'package:vpn/const/const_img.dart';
import 'package:vpn/presentation/sign/sign_up_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _curPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              Column(
                children: [
                  SizedBox(height: 203, child: _buildPageView()),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      cosntImg.length,
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.all(2),
                        width: _curPage == index ? 8 : 12,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              _curPage == index
                                  ? Color(0xff0cbc8b)
                                  : Color(0xffcecdcd),
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 29.0, top: 32.0),
                    child: BuildText(
                      text: 'Secure Browsing\nWith no limits',
                      textAlign: TextAlign.center,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  BuildText(
                    text:
                        'we are commited to always putting\nyour safety first',
                    textAlign: TextAlign.center,
                    fontSize: 15,
                  ),
                ],
              ),

              /// bot
              Column(
                children: [
                  BuildButton(
                    btnText: 'Start Your Free Trail',
                    textColor: Colors.white,
                    fontSize: 15,
                    btnColor: Color(0xff0cbc8b),
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      BuildText(
                        text: 'Have an Account?',
                        textAlign: TextAlign.center,
                        fontSize: 15,
                        textColor: Color(0xff0cbc8b),
                        fontWeight: FontWeight.w500,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            );
                          },
                          child: BuildText(
                            text: ' Sign in',
                            textAlign: TextAlign.center,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            textColor: Color(0xff0cbc8b),
                          ),
                        ),
                      ),
                    ],
                  ),
                  BuildText(
                    text: 'Skip',
                    textAlign: TextAlign.center,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  PageView _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: cosntImg.length,
      onPageChanged:
          (val) => setState(() {
            _curPage = val;
          }),
      itemBuilder: (context, index) {
        return SizedBox(child: BuildImage(imgPath: cosntImg[index]));
      },
    );
  }
}
