import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubits/account.dart';
import '../../logic/states/accounts.dart';
import '../../utils/app_router.dart';
import '../../utils/layout.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Layout(
      body: BlocBuilder<AccountsCubit, AccountsState>(
          builder: (BuildContext context, AccountsState state) {
        return Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Volver a mis cuentas'),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, Routes.indexAccounts),
              ),
              SizedBox(child: Text('Banco: ${state.selectedAccount!.name}')),
              SizedBox(child: Text('Saldo: ${state.selectedAccount!.balance}')),
              ElevatedButton(
                child: const Text('Ver movimientos'),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, Routes.indexTransactions),
              ),
            ],
          ),
        );
      }),
    );
  }
}
