import 'package:flutter/material.dart';
import 'package:flutter_application_3/utils/account_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/account.dart';
import '../../logic/states/accounts.dart';
import '../../utils/app_router.dart';
import '../../utils/layout.dart';

class AccountsIndexScreen extends StatelessWidget {
  const AccountsIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<AccountsCubit>().setSelectedAccount(null);
                  Navigator.pushReplacementNamed(
                      context, Routes.upsertAccounts);
                },
                child: const Text('Crear cuenta'),
              ),
              BlocBuilder<AccountsCubit, AccountsState>(
                builder: (BuildContext context, AccountsState state) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: AccountList(
                      accounts: state.accounts,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
