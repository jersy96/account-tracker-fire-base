import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/models/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/account.dart';
import '../../logic/states/accounts.dart';
import '../../utils/app_router.dart';
import '../../utils/base_text_form_field.dart';

class AccountsForm extends StatefulWidget {
  const AccountsForm({super.key});

  @override
  State<AccountsForm> createState() => _AccountsForm();
}

class _AccountsForm extends State<AccountsForm> {
  bool isUpdating = false;
  String? id;
  String? name;
  double? balance;

  @override
  void initState() {
    super.initState();
    AccountsCubit accountsCubit = context.read<AccountsCubit>();
    isUpdating = accountsCubit.state.selectedAccount != null;
    id = accountsCubit.state.selectedAccount?.id;
    name = accountsCubit.state.selectedAccount?.name;
    balance = accountsCubit.state.selectedAccount?.balance;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountsCubit, AccountsState>(
      listener: (BuildContext context, AccountsState state) {
        if (state.status == AccountsStatus.createSuccess ||
            state.status == AccountsStatus.updateSuccess) {
          Navigator.pushReplacementNamed(context, Routes.indexAccounts);
        } else if (state.status == AccountsStatus.createFailure ||
            state.status == AccountsStatus.updateFailure) {
          const SnackBar snackBar = SnackBar(content: Text('Error'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Volver a mis cuentas'),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, Routes.indexAccounts),
            ),
            if (isUpdating)
              ElevatedButton(
                child: const Text('Ver movimientos'),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, Routes.indexTransactions),
              ),
            BaseTextFormField(
              initialValue: name,
              decoration: const InputDecoration(
                hintText: 'Digite el nombre de la cuenta',
              ),
              onChanged: (String? value, bool valid) {
                setState(() => name = valid ? value : null);
              },
            ),
            const SizedBox(height: 2.0),
            BaseTextFormField(
              initialValue: balance?.toString(),
              decoration: const InputDecoration(
                hintText: 'Digite el saldo',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) return 'Digite un saldo';
                try {
                  double.parse(value);
                  return null;
                } catch (error) {
                  return "Digite un saldo numerico";
                }
              },
              onChanged: (String? value, bool valid) {
                setState(() => balance = valid ? double.parse(value!) : null);
              },
            ),
            const SizedBox(height: 16.0),
            if (_canBuildAccount()) _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  bool _canBuildAccount() {
    return (name != null && balance != null);
  }

  Widget _buildSubmitButton() {
    AccountsStatus status = context.watch<AccountsCubit>().state.status;
    if (status == AccountsStatus.loading) {
      return const CircularProgressIndicator();
    } else {
      return ElevatedButton(
        onPressed: () {
          Account account = _buildAccount();
          if (isUpdating) {
            context.read<AccountsCubit>().update(account);
          } else {
            context.read<AccountsCubit>().create(account);
          }
        },
        child: const Text('Submit'),
      );
    }
  }

  Account _buildAccount() {
    return Account(
      id: id,
      name: name!,
      balance: balance!,
    );
  }
}
