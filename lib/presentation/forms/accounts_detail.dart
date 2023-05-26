import 'package:flutter/material.dart';

import '../../models/account.dart';

class AccountDetailsPage extends StatelessWidget {
  final Account account;
  const AccountDetailsPage({super.key, required this.account});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title:
            const Text("Detalles de la cuenta", style: TextStyle(fontSize: 15)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(child: Text('Banco: ${account.name}')),
            SizedBox(child: Text('Saldo: ${account.balance}'))
          ],
        ),
      ),
    );
  }
}
