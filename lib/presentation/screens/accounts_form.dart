import 'package:flutter/material.dart';

import '../../utils/layout.dart';
import '../forms/accounts.dart';

class AccountsFormScreen extends StatelessWidget {
  const AccountsFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      body: AccountsForm(),
    );
  }
}
