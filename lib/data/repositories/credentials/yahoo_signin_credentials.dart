import 'package:firebase_auth/firebase_auth.dart';

class YahooAuthImpl {
  Future<YahooAuthProvider> signInWithProvider() async {
    try {
      final yahooProvider = YahooAuthProvider();
      return yahooProvider;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<YahooAuthProvider> signOut() async {
    try {
      YahooAuthProvider provider = YahooAuthProvider();
      return provider;
    } catch (e) {
      throw Exception(e);
    }
  }
}
