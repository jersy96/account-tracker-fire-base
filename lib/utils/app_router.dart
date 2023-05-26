import 'package:flutter/material.dart';
import 'package:flutter_application_3/logic/cubits/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/account.dart';
import '../presentation/forms/accounts_detail.dart';
import '../presentation/screens/accounts_form.dart';
import '../presentation/screens/accounts_index.dart';

class Routes {
  static const String indexAccounts = 'indexAccounts';
  static const String createAccount = 'createAccounts';
  static const String accountDetails = 'accountDetails';
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
      case Routes.createAccount:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountsCubit>.value(
            value: _accountsCubit,
            child: const AccountsFormScreen(),
          ),
        );
      case Routes.accountDetails:
        final Account account = routeSettings.arguments as Account;
        return MaterialPageRoute(
          builder: (_) => AccountDetailsPage(account: account),
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
