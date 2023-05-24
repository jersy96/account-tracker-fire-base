import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/account.dart';
import '../../logic/states/accounts.dart';
import '../../utils/app_router.dart';

class AccountsForm extends StatefulWidget {
  const AccountsForm({super.key});

  @override
  State<AccountsForm> createState() => _AccountsForm();
}

class _AccountsForm extends State<AccountsForm> {
  String? name;
  String? balance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Digite el nombre del Banco',
            ),
            onChanged: (String value) => setState(() => name = value),
          ),
          const SizedBox(height: 2.0),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Digite el saldo',
            ),
            onChanged: (String value) => setState(() => balance = value),
          ),
          const SizedBox(height: 16.0),
          if (_canBuildAccount())
            BlocConsumer<AccountsCubit, AccountsState>(
                listener: (BuildContext context, AccountsState state) {
              if (state.status == AccountsStatus.indexSuccess) {
                Navigator.pushReplacementNamed(context, Routes.indexAccounts);
              } else if (state.status == AccountsStatus.indexFailure) {
                const SnackBar snackBar = SnackBar(content: Text('Error'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }, builder: (BuildContext context, AccountsState state) {
              if (state.status == AccountsStatus.loading) {
                return const CircularProgressIndicator();
              } else {
                return ElevatedButton(
                  onPressed: () {
                    Account account = _buildAccount();
                    context.read<AccountsCubit>().create(account);
                  },
                  child: const Text('Submit'),
                );
              }
            }),
        ],
      ),
    );
  }

  bool _canBuildAccount() {
    return (name != null && balance != null);
  }

  Account _buildAccount() {
    return Account(
      name: name!,
      balance: balance!,
    );
  }
}
