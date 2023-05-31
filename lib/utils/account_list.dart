import 'package:flutter/material.dart';
import 'package:flutter_application_3/logic/cubits/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/account.dart';
import 'app_router.dart';

class AccountList extends StatelessWidget {
  final List<Account> accounts;

  const AccountList({Key? key, required this.accounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: accounts.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(accounts[index].name),
          onTap: () {},
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.account_balance),
                tooltip: 'Ver Detalles de Cuenta ',
                onPressed: () {
                  context
                      .read<AccountsCubit>()
                      .setSelectedAccount(accounts[index]);
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.accountDetails,
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Eliminar',
                onPressed: () {
                  context.read<AccountsCubit>().delete(accounts[index]);
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
