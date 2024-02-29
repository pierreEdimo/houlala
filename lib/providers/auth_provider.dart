import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/helper/user_token.helper.dart';
import 'package:houlala/models/login/login_model.dart';
import 'package:houlala/models/user_token/user_token.dart';
import 'package:houlala/repositories/auth/auth_repository.dart';
import 'package:houlala/state/auth/user_model.state.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

final authRepositoryStateNotifier = StateNotifierProvider<AuthRepositoryStateNotifier, UserModelState>(
        (ref) => AuthRepositoryStateNotifier(ref.watch(authRepositoryProvider)));

class AuthRepositoryStateNotifier extends StateNotifier<UserModelState> {
  final AuthRepository authRepository;

  AuthRepositoryStateNotifier(this.authRepository) : super(UserModelState());

  Future<void> login(LoginModel loginModel) async {
    try {
      UserToken token = await authRepository.login(loginModel);
      UserTokenHelper.saveToken(token);
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage: 'impossible de se connecter sur Houla la. '
              'veuillez reessayer plutard. Si le probleme persiste,'
              ' contacter le service client');
    }
  }
}
