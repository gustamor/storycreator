import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthImpl {
  Future<OAuthCredential?> signInCredentials() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      try {
        if (loginResult.status == LoginStatus.success) {
          // you are logged
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(loginResult.accessToken!.token);
          return facebookAuthCredential;
        }
        return null;
      } catch (e) {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      await FacebookAuth.instance.logOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
