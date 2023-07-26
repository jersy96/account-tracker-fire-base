import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/forms/login_form.dart';

import '../../utils/layout.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      'Accede',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}