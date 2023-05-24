import 'package:flutter_application_3/models/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/accounts.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsState.initial());
  Future<void> create(Account account) async {
    emit(state.copyWith(status: AccountsStatus.loading));
    try {
      final List<Account> newAccount = List.from(state.accounts);
      newAccount.add(account);
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

  void setSelectedAccount(Account account) {
    emit(state.copyWith(
      status: AccountsStatus.indexSuccess,
      selectedAccount: account,
    ));
  }
}
