import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:story_creator/data/repositories/signin_credentials_github_repository.dart';

final githubAppProvider = FutureProvider<GithubAuthImpl>((ref) async {
  final githubSign = GithubAuthImpl();
  return githubSign;
});
