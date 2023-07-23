import 'package:flutter/material.dart';

import 'base_text_form_field.dart';

class PasswordFormField extends StatefulWidget {
  final void Function(String? value, bool valid) onChange;
  final Function? additionalValidator;
  final String? emptyMessage;
  final String? labelText;
  final void Function(String)? onFieldSubmitted;

  const PasswordFormField({
    Key? key,
    required this.onChange,
    this.additionalValidator,
    this.emptyMessage,
    this.labelText,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      decoration: InputDecoration(
        prefixIcon: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: widget.labelText ?? 'password',
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: obscureText,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return widget.emptyMessage ?? 'ingrese contrasena';
        }
        if (widget.additionalValidator != null) {
          return widget.additionalValidator!(value);
        }
        return null;
      },
      onChanged: (String? value, bool valid) {
        widget.onChange(value, valid);
      },
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
