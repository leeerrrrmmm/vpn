import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn/components/build_button.dart';
import 'package:vpn/components/build_text.dart';
import 'package:vpn/presentation/forgot/Verify_successful_screen.dart';

class InputCodeScreen extends StatefulWidget {
  const InputCodeScreen({super.key});

  @override
  State<InputCodeScreen> createState() => _InputCodeScreenState();
}

class _InputCodeScreenState extends State<InputCodeScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  bool isAllFilled = false;

  void _onChanget(int index, String value) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    bool allFilled = _controllers.every((el) => el.text.isNotEmpty);

    if (allFilled) {
      setState(() {
        isAllFilled = true;
      });
    } else {
      setState(() {
        isAllFilled = false;
      });
    }
  }

  @override
  void dispose() {
    for (var contoller in _controllers) {
      contoller.dispose();
    }
    for (var focus in _focusNodes) {
      focus.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildText(
                text: 'Seems you lost\nyour key😢',
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 39.0, bottom: 117.0),
                child: BuildText(
                  text:
                      "Please input your verification code\nbelow to verify your account",
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: SizedBox(
                      height: 60,
                      width: 78,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlignVertical: TextAlignVertical.top,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0XFFD9D9D9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.zero, // убирает внутренние отступы
                          counterText: '', // счетчик maxLength: 1,
                        ),
                        onChanged: (val) => _onChanget(index, val),
                      ),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 41.0, bottom: 37.0),
                child: BuildButton(
                  onTap: () {
                    if (!isAllFilled) return;

                    for (var controller in _controllers) {
                      controller.clear();
                    }

                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => VerifySuccessfulScreen(),
                      ),
                    );
                  },

                  btnText: !isAllFilled ? 'Send code' : 'Verify',
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
      ),
    );
  }
}
