import 'package:apex_sc/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? color;
  const MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonWidth,
      this.buttonHeight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      height: buttonHeight ?? 56,
      minWidth: buttonWidth ?? 327,
      color: color,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
