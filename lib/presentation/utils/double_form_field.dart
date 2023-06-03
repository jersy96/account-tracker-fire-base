import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/base_text_form_field.dart';

class DoubleFormField extends StatelessWidget {
  final void Function(double?, bool)? onChanged;
  final InputDecoration decoration;
  final double? initialValue;
  final String? Function(String?)? validator;

  const DoubleFormField({
    super.key,
    required this.onChanged,
    required this.decoration,
    this.initialValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      initialValue: initialValue?.toString(),
      decoration: decoration,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Provide the required information";
        }
        if (validator != null) return validator!(value);
        return null;
      },
      onChanged: (String? value, bool valid) {
        if (onChanged != null) {
          onChanged!(
              value == null || value == '' ? null : double.parse(value), valid);
        }
      },
    );
  }
}
