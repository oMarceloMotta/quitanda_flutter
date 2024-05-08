import 'package:greengrocer/src/constants/endpoints.dart';

import '../../../services/http_manager.dart';
import '../result/auth_result.dart';
import './auth_error.dart' as authError;
import '../../../models/user_model.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();
  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        headers: {'X-Parse-Session-Token': token});
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authError.authErrosString(result['error']));
    }
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager
        .restRequest(url: Endpoints.sigin, method: HttpMethods.post, body: {
      "email": email,
      "password": password,
    });

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(authError.authErrosString(result['error']));
    }
  }
}
