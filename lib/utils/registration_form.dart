import 'package:flutter/material.dart';
import 'package:flutter_application_3/logic/services/firebase_service.dart';
import 'package:flutter_application_3/utils/email_text_form_field.dart';
import 'package:flutter_application_3/utils/name_form_field.dart';
import 'package:flutter_application_3/utils/password_form_field.dart';

import '../data/models/user.dart';
import 'app_router.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              NameFormField(
                onFieldSubmitted: (_) => _submitForm(),
                onChange: (String? value, bool valid) {
                  setState(() => name = valid ? value : null);
                },
              ),
              const SizedBox(height: 20),
              EmailFormField(
                onChange: (String? value, bool valid) {
                  setState(() => email = valid ? value : null);
                },
              ),
              const SizedBox(height: 20),
              PasswordFormField(
                // onFieldSubmitted: (_) => _submitForm(),
                onChange: (String? value, bool valid) {
                  setState(() => password = valid ? value : null);
                },
              ),
              const SizedBox(height: 20),
              PasswordFormField(
                onFieldSubmitted: (_) => _submitForm(),
                labelText: 'confirma tu password',
                emptyMessage: 'completa tu password',
                additionalValidator: (String? value) {
                  if (value != password) {
                    return 'no coincide';
                  }
                  return null;
                },
                onChange: (String? value, bool valid) {
                  setState(() => confirmPassword = valid ? value : null);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async => {
                  _submitForm(),
                  Navigator.pushReplacementNamed(context, Routes.indexAccounts),
                },
            child: const Text('Enviar Email'))
      ],
    );
  }

  User _buildUser() {
    return User(
        // last: name!,
        // email: email!,
        );
  }

  void _submitForm() {
    User user = _buildUser();
    createUser(user);
  }
}
