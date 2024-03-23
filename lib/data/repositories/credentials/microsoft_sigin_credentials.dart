import 'package:firebase_auth/firebase_auth.dart';

class MicrosoftAuthImpl {
  Future<MicrosoftAuthProvider> signInWithProvider() async {
    try {
      final appProvider = MicrosoftAuthProvider();
      return appProvider;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<MicrosoftAuthProvider> signOut() async {
    try {
      MicrosoftAuthProvider provider = MicrosoftAuthProvider();
      return provider;
    } catch (e) {
      throw Exception(e);
    }
  }
}
