import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houlala/helper/user_token.helper.dart';
import 'package:houlala/models/login/login_model.dart';
import 'package:houlala/models/user_model/user_model.dart';
import 'package:houlala/models/user_token/user_token.dart';
import 'package:houlala/repositories/auth/auth_repository.dart';
import 'package:houlala/state/auth/user_model.state.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());

final authRepositoryStateNotifierProvider =
    StateNotifierProvider<AuthRepositoryStateNotifier, UserModelState>((ref) =>
        AuthRepositoryStateNotifier(ref.watch(authRepositoryProvider)));

class AuthRepositoryStateNotifier extends StateNotifier<UserModelState> {
  final AuthRepository authRepository;

  AuthRepositoryStateNotifier(this.authRepository) : super(UserModelState()) {
    loadConnectedUser();
  }

  Future<void> login(LoginModel loginModel) async {
    try {
      UserToken token = await authRepository.login(loginModel);
      UserTokenHelper.saveToken(token);
      state = state.copyWith(loading: true);
      UserModel connectedUser = await authRepository.fetchConnectUser(token);
      state = state.copyWith(connectedUser: connectedUser, loading: false);
    } catch (e) {
      state = state.copyWith(
          error: true,
          errorMessage: 'impossible de se connecter sur Houla la. '
              'veuillez reessayer plutard. Si le probleme persiste,'
              ' contacter le service client');
    }
  }

  Future<void> loadConnectedUser() async {
    UserToken? userToken = await UserTokenHelper.getUserToken();
    if(userToken != null){
      try {
        state = state.copyWith(loading: true);
        UserModel connectedUser =
        await authRepository.fetchConnectUser(userToken);
        state = state.copyWith(loading: false, connectedUser: connectedUser);
      } catch (e) {
        state = state.copyWith(
            error: true,
            errorMessage:
            ("Vous n'avez pas ete retrouve dans notre dans notre base de donne, veillez ressayer plutard"
                "si le probleme persiste, contactez notre service client."));
      }
    }
  }

  Future<void> logout() async {
    state = state.copyWith(connectedUser: null);
  }
}
