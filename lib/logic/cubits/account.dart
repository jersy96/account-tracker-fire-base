import 'package:flutter_application_3/data/models/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/transaction.dart';
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
          status: AccountsStatus.createSuccess,
          accounts: newAccounts,
          idCount: state.idCount + 1,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.createFailure,
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
            status: AccountsStatus.updateSuccess, accounts: newAccounts),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.updateFailure,
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
            status: AccountsStatus.deleteSuccess, accounts: newAccount),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.deleteFailure,
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

  void setSelectedTransaction(Transaction? transaction) {
    emit(state.copyWith(
      selectedTransaction: transaction,
    ));
  }

  Future<void> createTransaction(Transaction transaction) async {
    try {
      emit(state.copyWith(status: AccountsStatus.loading));
      List<Account> accounts = List.from(state.accounts);
      Account newSelectedAccount = state.selectedAccount!;
      for (Account account in accounts) {
        if (account == state.selectedAccount) {
          transaction.id = state.transactionsIdCount.toString();
          account.addTransaction(transaction);
          newSelectedAccount = account;
        }
      }
      emit(
        state.copyWith(
          status: AccountsStatus.createTransactionSuccess,
          accounts: accounts,
          selectedAccount: newSelectedAccount,
          transactionsIdCount: state.transactionsIdCount + 1,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.createTransactionFailure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> updateTransaction(Transaction transaction) async {
    emit(state.copyWith(status: AccountsStatus.loading));
    try {
      List<Account> accounts = List.from(state.accounts);
      Account newSelectedAccount = state.selectedAccount!;
      for (Account account in accounts) {
        if (account == state.selectedAccount) {
          account.updateTransaction(transaction);
          newSelectedAccount = account;
        }
      }
      emit(
        state.copyWith(
          status: AccountsStatus.createTransactionSuccess,
          accounts: accounts,
          selectedAccount: newSelectedAccount,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.createTransactionFailure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> deleteTransaction(Transaction transaction) async {
    emit(state.copyWith(status: AccountsStatus.loading));
    try {
      List<Account> accounts = List.from(state.accounts);
      Account newSelectedAccount = state.selectedAccount!;
      for (Account account in accounts) {
        if (account == state.selectedAccount) {
          account.removeTransaction(transaction);
          newSelectedAccount = account;
        }
      }
      emit(
        state.copyWith(
          status: AccountsStatus.deleteTransactionSuccess,
          accounts: accounts,
          selectedAccount: newSelectedAccount,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: AccountsStatus.deleteTransactionFailure,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
