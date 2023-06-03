import 'package:flutter/material.dart';
import 'package:flutter_application_3/logic/cubits/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/screens/accounts_form.dart';
import '../presentation/screens/accounts_index.dart';
import '../presentation/screens/transactions_form.dart';
import '../presentation/screens/transactions_index.dart';

class Routes {
  static const String indexAccounts = 'indexAccounts';
  static const String upsertAccounts = 'upsertAccounts';
  static const String indexTransactions = 'indexTransactions';
  static const String upsertTransactions = 'upsertTransactions';
}

class AppRouter {
  final AccountsCubit _accountsCubit = AccountsCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.indexAccounts:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountsCubit>.value(
            value: _accountsCubit,
            child: const AccountsIndexScreen(),
          ),
        );
      case Routes.upsertAccounts:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountsCubit>.value(
            value: _accountsCubit,
            child: const AccountsFormScreen(),
          ),
        );
      case Routes.indexTransactions:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountsCubit>.value(
            value: _accountsCubit,
            child: const TransactionsIndexScreen(),
          ),
        );
      case Routes.upsertTransactions:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountsCubit>.value(
            value: _accountsCubit,
            child: const TransactionsFormScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountsCubit>.value(
            value: _accountsCubit,
            child: const AccountsIndexScreen(),
          ),
        );
    }
  }
}
