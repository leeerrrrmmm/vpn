import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({super.key, required this.imgPath});

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imgPath);
  }
}
