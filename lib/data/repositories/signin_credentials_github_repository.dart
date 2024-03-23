import 'package:firebase_auth/firebase_auth.dart';

class GithubAuthImpl {
  Future<GithubAuthProvider> signInWithProvider() async {
    try {
      GithubAuthProvider provider = GithubAuthProvider();

      return provider;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<GithubAuthProvider> signOut() async {
    try {
      GithubAuthProvider provider = GithubAuthProvider();
      return provider;
    } catch (e) {
      throw Exception(e);
    }
  }
}

