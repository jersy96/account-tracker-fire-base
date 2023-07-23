import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String? email;

  AuthUser(this.id, this.email);

  @override
  List<Object?> get props => [id];
}

abstract class AuthRepositoryBase {
  Stream<AuthUser?> get onAuthStateChanged;
  Future<AuthUser?> signInAnonymously();
  Future<void> signOut();
}
