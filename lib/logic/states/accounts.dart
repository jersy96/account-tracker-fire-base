import 'package:flutter_application_3/data/models/account.dart';

import '../../data/models/transaction.dart';

enum AccountsStatus {
  initial,
  loading,
  createSuccess,
  createFailure,
  updateSuccess,
  updateFailure,
  deleteSuccess,
  deleteFailure,
  createTransactionSuccess,
  createTransactionFailure,
  updateTransactionSuccess,
  updateTransactionFailure,
  deleteTransactionSuccess,
  deleteTransactionFailure,
}

class AccountsState {
  final int idCount;
  final int transactionsIdCount;
  final AccountsStatus status;
  final List<Account> accounts;
  final String? errorMessage;
  final Account? selectedAccount;
  final Transaction? selectedTransaction;

  AccountsState({
    required this.idCount,
    required this.transactionsIdCount,
    required this.status,
    required this.accounts,
    this.errorMessage,
    this.selectedAccount,
    this.selectedTransaction,
  });

  AccountsState copyWith({
    int? idCount,
    int? transactionsIdCount,
    AccountsStatus? status,
    List<Account>? accounts,
    String? errorMessage,
    Account? selectedAccount,
    Transaction? selectedTransaction,
  }) {
    return AccountsState(
      idCount: idCount ?? this.idCount,
      transactionsIdCount: transactionsIdCount ?? this.transactionsIdCount,
      status: status ?? this.status,
      accounts: accounts ?? this.accounts,
      selectedAccount: selectedAccount ?? this.selectedAccount,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedTransaction: selectedTransaction ?? this.selectedTransaction,
    );
  }

  AccountsState.initial()
      : status = AccountsStatus.initial,
        accounts = [
          Account(id: '1', name: 'bancolombia', balance: 100),
          Account(id: '2', name: 'davivienda', balance: 200),
        ],
        errorMessage = null,
        selectedAccount = null,
        selectedTransaction = null,
        idCount = 3,
        transactionsIdCount = 1;
}
