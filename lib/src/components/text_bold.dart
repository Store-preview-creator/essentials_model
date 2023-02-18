import 'package:essentials_model/essentials_model.dart';
import 'package:flutter/material.dart';

class TextBold extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final Color? color;
  final double? size;
  const TextBold({
    super.key,
    required this.text,
    this.alignment = TextAlign.left,
    this.color,
    this.size = SizeOutlet.textSizeBase,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: alignment,
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: FontFamilyOutlet.fontBold,
      ),
    );
  }
}
