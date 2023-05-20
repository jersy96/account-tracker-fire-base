import 'package:flutter_application_3/models/account.dart';

enum AccountsStatus {
  initial,
  loading,
  success,
  failure,
}

class AccountsState {
  final AccountsStatus status;
  final List<Account> accounts;

  AccountsState({
    required this.status,
    required this.accounts,
  });

  AccountsState copyWith({
    AccountsStatus? status,
    List<Account>? accounts,
  }) {
    return AccountsState(
      status: status ?? this.status,
      accounts: accounts ?? this.accounts,
    );
  }

  AccountsState.initial()
      : status = AccountsStatus.initial,
        accounts = [];
}
