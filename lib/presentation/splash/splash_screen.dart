import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn/components/build_img.dart';
import 'package:vpn/components/build_text.dart';
import 'package:vpn/presentation/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2)).then((_) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (_) => Onboarding()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0cbc8b),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildImage(imgPath: 'assets/images/logo.png'),
            const SizedBox(height: 115),
            BuildText(
              text: 'Hide VPN',
              textColor: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
