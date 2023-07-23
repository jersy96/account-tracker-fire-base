// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_3/data/models/repository/auth_repository.dart';
import 'package:flutter_application_3/data/models/repository/implementation/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  late StreamSubscription authSubscription;
  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> init() async {
    authSubscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  void _authStateChanged(AuthUser? user) =>
      user == null ? emit(AuthSignedOut()) : emit(AuthSignedSuccess(user));

  Future<void> signInAnonymously() =>
      _signIn(_authRepository.signInAnonymously());

  @override
  Future<void> close() {
    authSubscription.cancel();
    return super.close();
  }

  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      emit(AuthSigningLoading());
      final user = await auxUser;
      if (user == null) {
        emit(AuthFailure(errorMessage: "Unknown error, try again later"));
      } else {
        emit(AuthSignedSuccess(user));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: "Error ${e.toString()}"));
    }
  }
}

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthSignedOut extends AuthState {}

class AuthSigningLoading extends AuthState {}

class AuthFailure extends AuthState {
  String errorMessage;
  AuthFailure({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}

class AuthSignedSuccess extends AuthState {
  final AuthUser user;

  AuthSignedSuccess(this.user);
  @override
  List<Object?> get props => [];
}
