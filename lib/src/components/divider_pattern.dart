import 'package:essentials_model/essentials_model.dart';
import 'package:flutter/material.dart';

class DividerPattern extends StatelessWidget {
  const DividerPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: const [
          Expanded(
            child: Divider(
              color: ColorOutlet.colorWhite,
              height: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Icon(
              Icons.circle,
              size: 10,
              color: ColorOutlet.colorWhite,
            ),
          ),
          Expanded(
            child: Divider(
              color: ColorOutlet.colorWhite,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
