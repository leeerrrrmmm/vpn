import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn/components/build_button.dart';
import 'package:vpn/components/build_text.dart';
import 'package:vpn/presentation/pre_login/pre_login_screen.dart';

class VerifySuccessfulScreen extends StatefulWidget {
  const VerifySuccessfulScreen({super.key});

  @override
  State<VerifySuccessfulScreen> createState() => _VerifySuccessfulScreenState();
}

class _VerifySuccessfulScreenState extends State<VerifySuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const SizedBox()),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33.0),
            child: Column(
              children: <Widget>[
                BuildText(
                  text: 'Verification\nsuccessful',
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 91.0),
                  child: CircleAvatar(
                    radius: 84,
                    backgroundColor: Color(0XFF0CBC8B),
                    child: Center(
                      child: Icon(Icons.done, size: 88, color: Colors.white),
                    ),
                  ),
                ),
                BuildText(
                  textAlign: TextAlign.center,
                  text: 'you have successfully\nupdated your password',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 35.0),
                BuildButton(
                  onTap:
                      () => Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => PreLogin()),
                        (route) => false,
                      ),
                  btnText: 'Go to home',
                  textColor: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  btnColor: Color(0XFF0CBC8B),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
