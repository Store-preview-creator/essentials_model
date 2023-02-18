import 'package:essentials_model/essentials_model.dart';
import 'package:flutter/material.dart';

class InputDropDownPattern extends StatefulWidget {
  final TextEditingController controller;
  final double? fontSize;
  final double? borderRadius;
  final List<String> list;
  const InputDropDownPattern({
    super.key,
    required this.controller,
    this.fontSize = 16,
    this.borderRadius = 10,
    required this.list,
  });

  @override
  State<InputDropDownPattern> createState() => _InputDropDownPatternState();
}

class _InputDropDownPatternState extends State<InputDropDownPattern> {
  @override
  void initState() {
    super.initState();
    widget.list.insert(0, 'Selecione uma opção');
    widget.controller.text = widget.list[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.controller.text,
      items: widget.list.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2),
                  child: Text(value, style: TextStyle(fontSize: widget.fontSize, color: Colors.grey)),
                ),
              ],
            ),
          ),
        );
      }).toList(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {
        widget.controller.text = value.toString();
        Log.info('value: $value');
      },
      validator: (value) {
        if (value == null || value == 'Selecione uma opção') {
          return 'Selecione uma opção';
        }
        return null;
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: widget.fontSize,
        ),
        hintStyle: TextStyle(
          fontSize: widget.fontSize,
          color: Colors.grey,
          fontFamily: 'TTNorms_Regular',
        ),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius!),
          ),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius!),
          ),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius!),
          ),
          borderSide: const BorderSide(
            color: ColorOutlet.colorPrimary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(widget.borderRadius!),
          ),
          borderSide: const BorderSide(
            color: ColorOutlet.colorPrimary,
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 12,
          color: ColorOutlet.colorPrimary,
        ),
      ),
    );
  }
}
