import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/logic/cubits/account.dart';

import '../presentation/screens/account.dart';

class Routes {
  static const String account = 'account';
}

class AppRouter {
  final AccountsCubit _AccountsCubit = AccountsCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.account:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<AccountsCubit>.value(
                  value: _AccountsCubit,
                  child: const AccountScreen(),
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<AccountsCubit>.value(
                  value: _AccountsCubit,
                  child: const AccountScreen(),
                ));
    }
  }
}
