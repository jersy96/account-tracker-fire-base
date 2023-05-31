import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/account.dart';
import '../../utils/app_router.dart';
import '../../utils/layout.dart';
import '../widgets/transaction_list.dart';

class TransactionsIndexScreen extends StatelessWidget {
  const TransactionsIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<AccountsCubit>().setSelectedAccount(null);
                Navigator.pushReplacementNamed(
                    context, Routes.createTransaction);
              },
              child: const Text('Crear movimiento'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TransactionList(
                transactions: context
                    .watch<AccountsCubit>()
                    .state
                    .selectedAccount!
                    .transactions,
              ),
            )
          ],
        ),
      ),
    );
  }
}
