import 'package:firebase_auth/firebase_auth.dart';

import '../auth_repository.dart';

class AuthRepository extends AuthRepositoryBase {
  final _firebaseAuth = FirebaseAuth.instance;

  AuthUser? _userfromFirebase(User? user) =>
      user == null ? null : AuthUser(user.uid, user.email);
  @override
  Stream<AuthUser?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().asyncMap(_userfromFirebase);

  @override
  Future<AuthUser?> signInAnonymously() async {
    final user = await _firebaseAuth.signInAnonymously();
    return _userfromFirebase(user.user);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
