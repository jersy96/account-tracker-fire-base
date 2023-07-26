import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/layout.dart';
import 'package:flutter_application_3/presentation/forms/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constarints) {
      return Layout(
        body: Center(
          child: SizedBox(
            // height: 300,
            width: constarints.maxWidth * 0.8,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Registrate para acceder',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RegistrationForm(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
