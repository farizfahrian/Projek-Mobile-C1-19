import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../models/user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<void> deleteAccount() async {
    return await _firebaseAuth.currentUser!.delete();
  }

  Future<void> updateEmail(String email) async {
    return await _firebaseAuth.currentUser!.updateEmail(email);
  }

  Future<void> updatePassword(String password) async {
    return await _firebaseAuth.currentUser!.updatePassword(password);
  }

  Future<void> updateUsername(String username) async {
    return await _firebaseAuth.currentUser!.updateDisplayName(username);
  }

  String getUsername() {
    return _firebaseAuth.currentUser!.displayName!;
  }

  String getEmail() {
    return _firebaseAuth.currentUser!.email!;
  }
}
