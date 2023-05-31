import 'package:flutter_application_3/models/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/accounts.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsState.initial());
  Future<void> create(Account account) async {
    emit(state.copyWith(status: AccountsStatus.loading));
    try {
      final List<Account> newAccounts = List.from(state.accounts);
      account.id = state.idCount.toString();
      newAccounts.add(account);
      emit(
        state.copyWith(
          status: AccountsStatus.indexSuccess,
          accounts: newAccounts,
          idCount: state.idCount + 1,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.indexFailure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> update(Account account) async {
    emit(state.copyWith(status: AccountsStatus.loading));
    try {
      final List<Account> newAccounts = state.accounts.map((Account acc) {
        if (account.id == acc.id) return account;
        return acc;
      }).toList();
      emit(
        state.copyWith(
            status: AccountsStatus.indexSuccess, accounts: newAccounts),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.indexFailure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> delete(Account account) async {
    emit(state.copyWith(status: AccountsStatus.loading));
    try {
      final List<Account> newAccount = List.from(state.accounts);
      newAccount.remove(account);
      emit(
        state.copyWith(
            status: AccountsStatus.indexSuccess, accounts: newAccount),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.indexFailure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  void setSelectedAccount(Account? account) {
    emit(state.copyWith(
      selectedAccount: account,
    ));
  }
}
