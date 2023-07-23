import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_text_form_field.dart';

class EmailFormField extends StatelessWidget {
  final void Function(String?, bool) onChange;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;

  const EmailFormField({
    super.key,
    this.initialValue,
    this.onFieldSubmitted,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      initialValue: initialValue,
      decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelStyle: TextStyle(
            color: Color(0xFFFF0000),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          labelText: 'email'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'ingrese su email';
        }
        final emailRegex = RegExp(r'^[\w-zñ\.]+@([\w-zñ]+\.)+[\w-z]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          return 'ingrese un email valido';
        }
        return null;
      },
      onChanged: (String? value, bool isValid) {
        onChange(value?.toLowerCase(), isValid);
      },
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
