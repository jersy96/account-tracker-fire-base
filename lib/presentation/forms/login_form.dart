import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/email_text_form_field.dart';
import '../utils/password_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Center(
              child: Text(
            'login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
          EmailFormField(
            onChange: (String? value, bool valid) {
              if (valid) setState(() => email = value);
            },
            onFieldSubmitted: (_) => _submitForm(),
          ),
          const SizedBox(
            height: 15,
          ),
          PasswordFormField(
              onFieldSubmitted: (_) => _submitForm(),
              onChange: (String? value, bool valid) {
                if (valid) setState(() => password = value);
              }),
          const SizedBox(
            height: 25,
          ),
          if (_canBuildSubmitButton()) _buildSubmitButton(),
          const SizedBox(height: 15)
        ],
      ),
    );
  }

  Widget _buildSubmitButton() => ElevatedButton(
        onPressed: () => {},
        child: Text('Submbit'),
      );

  bool _canBuildSubmitButton() {
    return email != null && password != null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // context.read<AuthenticationCubit>().login(email!, password!);
    }
  }
}
