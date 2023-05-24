import 'package:flutter_application_3/models/account.dart';

enum AccountsStatus {
  initial,
  loading,
  indexSuccess,
  indexFailure,
}

class AccountsState {
  final AccountsStatus status;
  final List<Account> accounts;
  final String? errorMessage;
  final Account? selectedAccount;

  AccountsState({
    required this.status,
    required this.accounts,
    this.errorMessage,
    required this.selectedAccount,
  });

  AccountsState copyWith({
    AccountsStatus? status,
    List<Account>? accounts,
    String? errorMessage,
    Account? selectedAccount,
  }) {
    return AccountsState(
      status: status ?? this.status,
      accounts: accounts ?? this.accounts,
      selectedAccount: selectedAccount ?? this.selectedAccount,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  AccountsState.initial()
      : status = AccountsStatus.initial,
        accounts = [],
        errorMessage = null,
        selectedAccount = null;
}
