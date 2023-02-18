import 'package:essentials_model/essentials_model.dart';
import 'package:flutter/material.dart';

class ButtonPatternOut extends StatelessWidget {
  final String label;
  final Color? color;
  final String? fontFamily;
  final Function()? onPressed;
  const ButtonPatternOut({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = ColorOutlet.colorPrimary,
    this.fontFamily = FontFamilyOutlet.fontMedium,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(SizeOutlet.borderRadius)),
      ),
      child: InkWell(
        onTap: onPressed ?? () {},
        borderRadius: BorderRadius.circular(SizeOutlet.borderRadius),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: color!),
            borderRadius: const BorderRadius.all(Radius.circular(SizeOutlet.borderRadius)),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'TTNorms_Medium',
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
