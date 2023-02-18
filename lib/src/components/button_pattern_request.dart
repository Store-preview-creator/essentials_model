import 'package:flutter/material.dart';

import '../theme/size_outlet.dart';
import 'button_pattern.dart';

class ButtonPatternRequest extends ButtonPattern {
  final ValueNotifier<bool> isLoading;

  const ButtonPatternRequest({
    super.key,
    required this.isLoading,
    required String label,
    required Function() onPressed,
  }) : super(
          label: label,
          onPressed: onPressed,
          textColor: Colors.black,
        );

  @override
  Function() get onPressed {
    return () {
      super.onPressed!();
    };
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoading,
      builder: (context, value, child) {
        return value
            ? Container(
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
                    onTap: () {},
                    borderRadius: BorderRadius.circular(SizeOutlet.borderRadius),
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            : super.build(context);
      },
    );
  }
}
