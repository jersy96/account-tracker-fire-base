import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/forms/account.dart';
import 'package:flutter_application_3/utils/account_list.dart';
import '../../utils/layout.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
        body: AccountForm(),
        child: AccountList(
          accounts: [],
        ));
  }
}
