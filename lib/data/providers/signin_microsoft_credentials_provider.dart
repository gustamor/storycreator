import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/repositories/credentials/microsoft_sigin_credentials.dart';

final microsoftAppProvider = FutureProvider<MicrosoftAuthImpl>((ref) async {
  final app = MicrosoftAuthImpl();
  return app;
});
