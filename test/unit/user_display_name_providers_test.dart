import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_get_displayname.dart';
import 'package:story_creator/domain/usecases/authentication_user/user_update_current_displayname.dart';

import 'user_display_name_providers_test.mocks.dart';

@GenerateMocks(
    [GetCurrentUserDisplayNameUseCase, UpdateCurrentUserDisplayNameUseCase])
void main() {
  group(
    'display name providers use cases',
    () {
      late String currentName;
      setUp(() {
        currentName = "Name";
      });
      test(
        'should return a display name',
        () async {
          final getCurrentName = MockGetCurrentUserDisplayNameUseCase();
          when(getCurrentName.invoke()).thenAnswer((_) async => currentName);
          expect(await getCurrentName.invoke(), currentName);
        },
      );

      test(
        'should update a display name',
        () async {
          final updateCurrentName = MockUpdateCurrentUserDisplayNameUseCase();

          expect(
            () async => await updateCurrentName.invoke(currentName),
            isA<void>(),
          );
        },
      );
    },
  );
}
