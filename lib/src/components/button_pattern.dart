import 'package:flutter/material.dart';

import '../theme/color_outlet.dart';
import '../theme/font_family_outlet.dart';
import '../theme/size_outlet.dart';

class ButtonPattern extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  final String? fontFamily;
  final Function()? onPressed;
  const ButtonPattern({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = ColorOutlet.colorPrimary,
    this.textColor = Colors.white,
    this.fontFamily = FontFamilyOutlet.fontMedium,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(SizeOutlet.borderRadius),
      ),
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(SizeOutlet.borderRadius),
        child: InkWell(
          onTap: onPressed ?? () {},
          borderRadius: BorderRadius.circular(SizeOutlet.borderRadius),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: SizeOutlet.textSizeBase,
                fontFamily: fontFamily,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
