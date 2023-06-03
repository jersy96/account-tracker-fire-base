import 'package:flutter/material.dart';

import '../../utils/layout.dart';
import '../forms/transactions.dart';

class TransactionsFormScreen extends StatelessWidget {
  const TransactionsFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      body: TransactionsForm(),
    );
  }
}
