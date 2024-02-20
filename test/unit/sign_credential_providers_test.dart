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

    test('Simular inicio de sesión con email y contraseña', () async {
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

    test('Simular registro de usuario con email y contraseña', () async {
    // Email y contraseña para el registro del usuario
    const email = 'newuser@example.com';
    const password = 'password123';

    // Crear un usuario mock que represente al nuevo usuario
    final mockUser = MockUser(
      isAnonymous: false,
      uid: 'newUserId',
      email: email, // Usa el email proporcionado para el registro
      displayName: 'New User',
    );

    // Inicializar MockFirebaseAuth con el estado inicial sin usuarios registrados
    final auth = MockFirebaseAuth(mockUser: mockUser, signedIn: false);

    // Simular el registro del nuevo usuario
    final result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Obtener el usuario a partir del resultado
    final user = result.user;

    // Verificar que el email del usuario registrado coincide con el email proporcionado
    expect(user!.email, equals(email));

    // Aquí podrías añadir más aserciones para verificar el comportamiento esperado de tu aplicación
  });

  
  });
}
