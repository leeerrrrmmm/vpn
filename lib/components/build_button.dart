import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    super.key,
    this.onTap,
    required this.btnText,
    this.btnColor,
    this.backgroundIconColor,
    this.fontSize,
    this.textColor,
    this.activeBorder = false,
    this.icon,
    this.iconColor,
    this.fontWeight,
  });

  final void Function()? onTap;
  final String btnText;
  final Color? btnColor;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundIconColor;
  final bool? activeBorder;
  final IconData? icon;
  final Color? iconColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(30),
          border:
              activeBorder != false
                  ? Border.all(width: 0.5, color: Colors.black)
                  : null,
        ),
        child: Row(
          mainAxisAlignment:
              icon == null ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (icon != null) ...[
              const SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: backgroundIconColor,
                child: Icon(icon, color: iconColor),
              ),
              Expanded(
                child: Text(
                  btnText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            ],
            if (icon == null) ...[
              Expanded(
                child: Text(
                  btnText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
