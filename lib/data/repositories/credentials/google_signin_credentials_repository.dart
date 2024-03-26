import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:story_creator/core/constants.dart';

class GoogleAuthImpl {
  Future<OAuthCredential> signInCredentials() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return credential;
    } catch (e) {
      logger.e("Google Auth:  $e");
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      final GoogleSignIn googleAuth = GoogleSignIn();
      googleAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
