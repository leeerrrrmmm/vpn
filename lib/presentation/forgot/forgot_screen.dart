import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn/components/build_button.dart';
import 'package:vpn/components/build_text.dart';
import 'package:vpn/presentation/forgot/input_otc_code.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BuildText(
              text: 'Seems you lost\nyour key😢',
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 33.0, bottom: 103.0),
              child: BuildText(
                text:
                    "Please input your email to get code\nverification to resrt your password.",
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            BuildText(text: 'Email', fontWeight: FontWeight.w500, fontSize: 15),
            const SizedBox(height: 7),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _emailController,
                validator:
                    (value) =>
                        !value!.contains('@gmail.com')
                            ? "Email doesn't exisy!"
                            : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36.0),
              child: BuildButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => InputCodeScreen(),
                      ),
                    );
                  }
                },
                btnText: 'Send code',
                textColor: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                btnColor: Color(0XFF0CBC8B),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BuildText(
                  text: 'Have a problem?',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                BuildText(
                  text: '\tContact us',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
