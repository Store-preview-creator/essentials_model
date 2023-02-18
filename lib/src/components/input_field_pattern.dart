import 'package:flutter/material.dart';

import 'input_field.dart';

class InputFieldPattern extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String prefixText;
  final bool digitsOnly;
  final int maxLength;
  final validator;
  final AutovalidateMode autovalidateMode;
  final Function(String)? onChanged;
  final bool formatNumber;

  const InputFieldPattern({
    super.key,
    this.label = '',
    this.prefixText = '',
    this.digitsOnly = false,
    this.keyboardType = TextInputType.text,
    this.maxLength = 10,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    required this.controller,
    this.onChanged,
    this.formatNumber = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Visibility(
            visible: label.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'TTNorms_Regular',
                  ),
                ),
              ),
            ),
          ),
          InputField(
            autovalidateMode: autovalidateMode,
            validator: validator,
            maxLength: maxLength,
            digitsOnly: digitsOnly,
            prefixText: prefixText,
            keyboardType: keyboardType,
            controller: controller,
            onChanged: onChanged,
            formatNumber: formatNumber,
          ),
        ],
      ),
    );
  }
}
