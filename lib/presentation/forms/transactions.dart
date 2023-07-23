import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/account.dart';
import '../../logic/states/accounts.dart';
import '../../data/models/transaction.dart';
import '../../utils/app_router.dart';
import '../../utils/base_text_form_field.dart';
import '../utils/base_dropdown_form_field.dart';
import '../utils/double_form_field.dart';

class TransactionsForm extends StatefulWidget {
  const TransactionsForm({super.key});

  @override
  State<TransactionsForm> createState() => _TransactionsForm();
}

class _TransactionsForm extends State<TransactionsForm> {
  bool isUpdating = false;
  String? id;
  TransactionType? type;
  double? value;
  String? description;

  @override
  void initState() {
    super.initState();
    AccountsCubit accountsCubit = context.read<AccountsCubit>();
    isUpdating = accountsCubit.state.selectedTransaction != null;
    id = accountsCubit.state.selectedTransaction?.id;
    type = accountsCubit.state.selectedTransaction?.type;
    value = accountsCubit.state.selectedTransaction?.value;
    description = accountsCubit.state.selectedTransaction?.description;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountsCubit, AccountsState>(
      listener: (BuildContext context, AccountsState state) {
        if (state.status == AccountsStatus.createTransactionSuccess ||
            state.status == AccountsStatus.updateTransactionSuccess) {
          Navigator.pushReplacementNamed(context, Routes.indexTransactions);
        } else if (state.status == AccountsStatus.createTransactionFailure ||
            state.status == AccountsStatus.updateTransactionFailure) {
          const SnackBar snackBar = SnackBar(content: Text('Error'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (isUpdating)
              ElevatedButton(
                child: const Text('Volver a movimientos'),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, Routes.indexTransactions),
              ),
            BaseDropdownFormField<TransactionType>(
              initialValue: type,
              decoration: const InputDecoration(labelText: 'Tipo'),
              items: TransactionType.values.map((value) {
                return DropdownMenuItem<TransactionType>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
              onChanged: (TransactionType? value) {
                setState(() => type = value);
              },
            ),
            const SizedBox(height: 2.0),
            DoubleFormField(
              initialValue: value,
              decoration: const InputDecoration(
                hintText: 'Valor',
              ),
              onChanged: (double? val, bool valid) {
                setState(() => value = valid ? val : null);
              },
            ),
            const SizedBox(height: 16.0),
            BaseTextFormField(
              initialValue: description,
              decoration: const InputDecoration(
                hintText: 'Descripcion',
              ),
              onChanged: (String? value, bool valid) {
                setState(() => description = valid ? value : null);
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
    return (type != null && value != null && description != null);
  }

  Widget _buildSubmitButton() {
    AccountsStatus status = context.watch<AccountsCubit>().state.status;
    if (status == AccountsStatus.loading) {
      return const CircularProgressIndicator();
    } else {
      return ElevatedButton(
        onPressed: () {
          Transaction transaction = _buildTransaction();
          if (isUpdating) {
            context.read<AccountsCubit>().updateTransaction(transaction);
          } else {
            context.read<AccountsCubit>().createTransaction(transaction);
          }
        },
        child: const Text('Submit'),
      );
    }
  }

  Transaction _buildTransaction() {
    return Transaction(
      id: id,
      type: type!,
      value: value!,
      description: description!,
    );
  }
}
