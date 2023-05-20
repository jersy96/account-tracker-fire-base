import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/account_list.dart';

class Layout extends StatelessWidget {
  final Widget body;

  const Layout({super.key, required this.body, required AccountList child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
