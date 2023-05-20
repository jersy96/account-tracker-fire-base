import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/account.dart';
import 'package:flutter_application_3/utils/account_list.dart';
import '../../logic/cubits/account.dart';
import '../../logic/states/acount.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key});

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  String? name;
  String? balance;
  final TextEditingController _textFieldController = TextEditingController();
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
              if (state.status == AccountsStatus.success) {
              } else if (state.status == AccountsStatus.failure) {
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
                    child: const Text('Submit'));
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
