import 'package:flutter/material.dart';
import 'package:vpn/presentation/main_screen/main_screen.dart';
import 'package:vpn/presentation/sign/sign_up_screen.dart';

class SignUpAnimatedTransitionScreen extends StatefulWidget {
  const SignUpAnimatedTransitionScreen({super.key});

  @override
  State<SignUpAnimatedTransitionScreen> createState() =>
      _SignUpAnimatedTransitionScreenState();
}

class _SignUpAnimatedTransitionScreenState
    extends State<SignUpAnimatedTransitionScreen> {
  bool _showPanels = false;
  bool _hideText = false;
  bool _showHome = false;

  @override
  void initState() {
    super.initState();

    // Панели вне экрана
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() => _showPanels = true); // панели заезжают в центр

      Future.delayed(Duration(milliseconds: 1200), () {
        // Когда панели начинают уезжать, скрываем SignUpScreen
        setState(() {
          _showPanels = false;
          _hideText = true; // прячем SignUpScreen
        });

        // После ухода панелей показываем главный экран
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            _showHome = true;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Главный экран
          if (_showHome)
            AnimatedOpacity(
              opacity: 1.0,
              duration: Duration(milliseconds: 500),
              child: MainScreen(),
            ),

          if (!_showHome)
            AnimatedOpacity(
              opacity: _hideText ? 0.0 : 1.0,
              duration: Duration(microseconds: 900),
              child: SignUpScreen(),
            ),

          // Верхняя панель
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            top: _showPanels ? 0 : -screenHeight / 2,
            left: 0,
            right: 0,
            height: screenHeight / 2,
            child: Container(color: Color(0XFF252837)),
          ),

          // Нижняя панель
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            bottom: _showPanels ? 0 : -screenHeight / 2,
            left: 0,
            right: 0,
            height: screenHeight / 2,
            child: Container(color: Color(0XFF252837)),
          ),
        ],
      ),
    );
  }
}
