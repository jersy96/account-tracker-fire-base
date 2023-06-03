import 'package:flutter/material.dart';
import 'package:flutter_application_3/logic/cubits/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/transaction.dart';
import '../../utils/app_router.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: transactions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(transactions[index].description),
          onTap: () {},
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.account_balance),
                tooltip: 'Ver Detalles de Movimiento ',
                onPressed: () {
                  context
                      .read<AccountsCubit>()
                      .setSelectedTransaction(transactions[index]);
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.upsertTransactions,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Eliminar',
                onPressed: () {
                  context
                      .read<AccountsCubit>()
                      .deleteTransaction(transactions[index]);
                },
              ),
            ],
          ),
          mouseCursor: SystemMouseCursors.click,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey[400],
          thickness: 1,
          height: 1,
        );
      },
    );
  }
}
