import 'package:flutter/material.dart';

import '../apptheme.dart';

class TextFieldEdited extends StatelessWidget {
  const TextFieldEdited({
    Key? key,
    required TextEditingController digitController,
    required this.suffixText,
    required this.validatorMessage,
  })  : _controller = digitController,
        super(key: key);

  final TextEditingController _controller;
  final String suffixText;
  final String validatorMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.grey[100],
        filled: true,
        suffixText: suffixText,
        suffixStyle: const TextStyle(
          color: AppTheme.kLightGreyText,
          fontSize: 25,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      style: const TextStyle(fontSize: 25),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
