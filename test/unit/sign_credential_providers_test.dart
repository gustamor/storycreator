import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:story_creator/data/repositories/firebase_authentication_repository.dart';
import 'package:story_creator/data/services/authentication_service.dart';
import 'package:story_creator/ui/models/ui_user.dart';
import 'package:story_creator/ui/providers/email_verification_provider.dart';
import 'package:story_creator/ui/providers/password_provider.dart';

class MockUiUser extends Mock implements UiUser {}

class MockitoFirebaseAuthRepository extends Mock
    implements FirebaseAuthenticationRepository {}

class MockitoFireBaseAuthService extends Mock implements AuthenticationService {
  @override
  Future<UiUser?> signIn(String email, String password) async {
    return const UiUser(email: "test@email.com", id: "id", userName: "test");
  }
}

@GenerateMocks([FirebaseApp])
void main() {
  const email = "gustavo.pinebox@gmail.com";
  const password = "abcdefgh1";
  group('Sign Provider Tests', () {
    test("should email expected is ''", () async {
      final container = ProviderContainer();
      final emailProvided = container.read(emailProvider);
      expect(emailProvided, '');
    });
    test("should email updated as expected", () async {
      final container = ProviderContainer();
      container.read(emailProvider.notifier).update((state) => state = email);
      final emailProvided = container.read(emailProvider);
      expect(emailProvided, email);
    });
    test("email validation is true", () async {
      final container = ProviderContainer();
      bool isValid = container.read(emailValidationProvider(email));
      expect(isValid, true);
    });

    test("should password expected is ''", () async {
      final container = ProviderContainer();
      final passwordProvided = container.read(passwordProvider);
      expect(passwordProvided, '');
    });

    test("should password updated as expected", () async {
      final container = ProviderContainer();
      container
          .read(passwordProvider.notifier)
          .update((state) => state = password);
      final passwordProvided = container.read(passwordProvider);
      expect(passwordProvided, password);
    });

    test(
        "should signInWithEmailAndPassword returns a MockUser instance or null",
        () async {
      final mockFirebaseAuthRepo = MockitoFirebaseAuthRepository();

      final userCredential = await mockFirebaseAuthRepo
          .signInWithEmailAndPassword(email, password);
      expect(userCredential, null);
    });

    test("should returns a email string or null", () async {
      final mockFirebaseAuthRepo = MockitoFirebaseAuthRepository();
      final userCredential = await mockFirebaseAuthRepo
          .signInWithEmailAndPassword(email, password);
      if (userCredential == null) {
        expect(userCredential, null);
      } else {
        expect(userCredential.email, isA<String>());
      }
    });

    test("should signIn returns a MockUiUser instance", () async {
      // Creación correcta de un mock
      final mockitoFireBaseAuthService = MockitoFireBaseAuthService();
      final user = await mockitoFireBaseAuthService.signIn(email, password);

      if (user == null) {
        expect(user, null);
      } else {
        expect(user, isA<UiUser>());
      }
    });

    test("should authentication service return a (mock)user email", () async {
      final mockitoFireBaseAuthService = MockitoFireBaseAuthService();
      final user = await mockitoFireBaseAuthService.signIn(email, password);

      if (user == null) {
        expect(user, null);
      } else {
        expect(user.email, "test@email.com");
      }
    });

    test("should authentication service return a UiUser id", () async {
      final mockitoFireBaseAuthService = MockitoFireBaseAuthService();
      final user = await mockitoFireBaseAuthService.signIn(email, password);

      if (user == null) {
        expect(user, null);
      } else {
        expect(user.id, "id");
      }
    });

    test("should authentication service return a UiUser userName", () async {
      final mockitoFireBaseAuthService = MockitoFireBaseAuthService();
      final user = await mockitoFireBaseAuthService.signIn(email, password);

      if (user == null) {
        expect(user, null);
      } else {
        expect(user.userName, "test");
      }
    });

    test('should sign in with emil and password', () async {
      final mockUser = MockUser(
        isAnonymous: false,
        uid: 'someuid',
        email: email,
        displayName: 'Test User',
      );

      final auth = MockFirebaseAuth(mockUser: mockUser);
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;
      expect(user!.email, equals(email));
    });

    test('should faild when session login with user and password', () async {
      final mockUser = MockUser(
        isAnonymous: false,
        uid: 'someuid',
        email: "fake@email.com",
        displayName: 'Test User',
      );

      final auth = MockFirebaseAuth(mockUser: mockUser);
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;

      expect(user!.email, isNot(equals(email)));
    });

    test('should user logout', () async {
      final mockUser = MockUser(
        isAnonymous: false,
        uid: 'someuid',
        email: email,
        displayName: 'Test User',
      );

      final auth = MockFirebaseAuth(mockUser: mockUser);
      final result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;
      expect(user!.email, equals(email));
      await auth.signOut();
      expect(auth.currentUser, isNot(equals(mockUser)));
    });

    test('should register user with email and password', () async {
      const email = 'newuser@example.com';
      const password = 'password123';

      final mockUser = MockUser(
        isAnonymous: false,
        uid: 'newUserId',
        email: email,
        displayName: 'New User',
      );

      final auth = MockFirebaseAuth(mockUser: mockUser, signedIn: false);

      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    });
    test('should returns normally when send email to reset password', () async {
      final mockAuth = MockFirebaseAuth();

      const email = 'user@example.com';

      await mockAuth.sendPasswordResetEmail(email: email);

      expect(() async {
        await mockAuth.sendPasswordResetEmail(email: email);
      }, returnsNormally);
    });

    test('update and get the displayName for the user',
        () async {
      final mockUser = MockUser(
        isAnonymous: false,
        uid: 'someuid',
        email: email,
        displayName: 'Initial Name',
      );
      final mockAuth = MockFirebaseAuth(mockUser: mockUser);
      final result = await mockAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Actualizar el displayName del usuario
      String newDisplayName = 'Updated Name';
      await mockAuth.currentUser!.updateDisplayName(newDisplayName);
      await mockAuth.currentUser!.reload();

      // Obtener el displayName actualizado
      final updatedDisplayName = mockAuth.currentUser!.displayName;

      // Verificar que el displayName ha sido actualizado correctamente
      expect(updatedDisplayName, equals(newDisplayName));
    });
  });
}
