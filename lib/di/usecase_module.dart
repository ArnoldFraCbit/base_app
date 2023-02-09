import 'package:base/domain/usecase/post_sign_in.dart';

import 'repository_module.dart';

mixin UseCaseModule on RepositoryModule {
  PostSignIn get postSignIn {
    return PostSignIn(signIn: signInRepository);
  }
}
