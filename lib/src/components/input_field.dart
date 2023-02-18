// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:essentials_model/essentials_model.dart';
import 'package:essentials_model/src/lexicon/Lexicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String hintText;
  final TextEditingController controller;
  final double fontSize;
  final double borderRadius;
  final validator;
  final TextInputType keyboardType;
  final bool digitsOnly;
  final String prefixText;
  final String label;
  final EdgeInsets padding;
  final bool passwordMode;
  final Function()? suffixIconFunction;
  final Function()? prefixIconFunction;
  final Function()? onTap;
  final Function(String)? onChanged;
  final AutovalidateMode autovalidateMode;
  final int maxLength;
  final bool formatNumber;
  const InputField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.fontSize = 16,
    this.borderRadius = 10,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.digitsOnly = false,
    this.prefixText = '',
    this.label = '',
    this.padding = const EdgeInsets.all(0),
    this.passwordMode = false,
    this.suffixIconFunction,
    this.prefixIconFunction,
    this.onTap,
    this.maxLength = 10,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.formatNumber = true,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(true);

    return ValueListenableBuilder(
      valueListenable: passwordVisible,
      builder: (context, value, child) => Padding(
        padding: widget.padding,
        child: TextFormField(
          maxLength: widget.maxLength,
          controller: widget.controller,
          obscureText: widget.passwordMode ? passwordVisible.value : false,
          inputFormatters: widget.digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : [],
          keyboardType: widget.keyboardType,
          validator: (widget.validator == null) ? (value) => (value!.isEmpty) ? Lexicon.requiredField : null : widget.validator,
          autovalidateMode: widget.autovalidateMode,
          onChanged: (value) {
            if (widget.keyboardType == TextInputType.number && widget.formatNumber) {
              // implementar formatação de número
            } else {
              widget.controller.text = value;
            }
            widget.controller.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));
            widget.onChanged?.call(value);
          },
          decoration: InputDecoration(
            counterText: '',
            prefixIcon: widget.prefixIcon != null
                ? InkWell(
                    borderRadius: BorderRadius.circular(SizeOutlet.borderRadius),
                    onTap: widget.prefixIconFunction ?? () {},
                    child: Icon(
                      widget.prefixIcon,
                      color: const Color(0xFF86869E),
                    ),
                  )
                : null,
            suffixIcon: widget.suffixIcon != null
                ? InkWell(
                    borderRadius: BorderRadius.circular(SizeOutlet.borderRadius),
                    onTap: widget.passwordMode ? () => passwordVisible.value = !passwordVisible.value : widget.suffixIconFunction ?? () {},
                    child: Icon(
                      widget.passwordMode ? (passwordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined) : widget.suffixIcon,
                      color: const Color(0xFF86869E),
                    ),
                  )
                : null,
            contentPadding: widget.prefixIcon != null ? const EdgeInsets.symmetric(horizontal: 0, vertical: 0) : const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            hintText: widget.label,
            prefixText: widget.prefixText,
            labelStyle: TextStyle(
              color: const Color(0xFF86869E),
              fontSize: widget.fontSize,
            ),
            hintStyle: TextStyle(
              fontSize: widget.fontSize,
              color: const Color(0xFFB4B4C0),
              fontFamily: FontFamilyOutlet.fontRegular,
            ),
            filled: true,
            fillColor: const Color(0xFFB4B4C0).withOpacity(0.1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 173, 84, 251),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 173, 84, 251),
              ),
            ),
            errorStyle: const TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 173, 84, 251),
              fontFamily: FontFamilyOutlet.fontMedium,
            ),
          ),
        ),
      ),
    );
  }
}
