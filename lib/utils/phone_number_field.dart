import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/utils/base_text_form_field.dart';

class PhoneFormField extends StatelessWidget {
  final void Function(String?, bool) onChange;
  final String? initialValue;
  final void Function(String)? onFieldSubmitted;
  const PhoneFormField(
      {super.key,
      required this.onChange,
      this.initialValue,
      this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
        initialValue: initialValue,
        decoration: const InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(
              CupertinoIcons.device_phone_portrait,
              color: Colors.grey,
            ),
            labelText: 'phone',
            filled: true,
            fillColor: Colors.white),
        keyboardType: TextInputType.phone,
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'numero de telefono';
          }
          final phoneRegex = RegExp(r'[0-9]');
          if (!phoneRegex.hasMatch(value)) {
            return 'ingrese numero de telefono';
          }
          if (value.length < 10) {
            return 'ingrese numero de telefono valido';
          }

          return null;
        },
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10)
        ]);
  }
}
