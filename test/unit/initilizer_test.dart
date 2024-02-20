
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:story_creator/core/initializers.dart';

import 'initilizer_test.mocks.dart';


@GenerateMocks([Init])
void main() async {
  group('Init class tests', () {
    test('setDeviceOrientation calls setPreferredOrientations', () async {
      final initializer = MockInit();
      await initializer.setDeviceOrientation();
      verify(initializer.setDeviceOrientation()).called(1);
    });

    test('setEnabledSystemUIMode calls setEnabledSystemUIMode', ()  async {
      final initializer = MockInit();
      await initializer.setEnabledSystemUIMode();
      verify(initializer.setEnabledSystemUIMode()).called(1);
    });

    test('configureDio called once ', ()  async {
      final initializer = MockInit();
      initializer.configureDio();
      verify( initializer.configureDio()).called(1);
    });
  });

}