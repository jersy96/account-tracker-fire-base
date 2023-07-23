import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'base_text_form_field.dart';

class NameFormField extends StatelessWidget {
  final void Function(String?, bool) onChange;
  final String? initialValue;
  final void Function(String)? onFieldSubmitted;
  const NameFormField({
    super.key,
    required this.onChange,
    this.initialValue,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
        initialValue: initialValue,
        decoration: const InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Icon(
            Icons.near_me,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Nombre',
        ),
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Ingresa tu nombre';
          }
          final nameRegExp = RegExp(
              r"^\s*([A-Za-z][A-Za-zñÑ]*(?:\s+[A-Za-z][A-Za-zñÑ]*)*\.?\s*)$");
          if (!nameRegExp.hasMatch(value)) {
            return 'Pon un nombre valido cole';
          }
          return null;
        });
  }
}
