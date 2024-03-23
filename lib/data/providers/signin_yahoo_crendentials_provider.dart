
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/repositories/credentials/yahoo_signin_credentials.dart';

final yahooAppProvider = FutureProvider<YahooAuthImpl>((ref) async {
  final githubSign = YahooAuthImpl();
  return githubSign;
});
