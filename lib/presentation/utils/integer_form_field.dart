import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/base_text_form_field.dart';

class IntegerFormField extends StatelessWidget {
  final void Function(int?, bool)? onChanged;
  final InputDecoration decoration;
  final int? initialValue;
  final String? Function(String?)? validator;

  const IntegerFormField({
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
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
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
              value == null || value == '' ? null : int.parse(value), valid);
        }
      },
    );
  }
}
