import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/user_model.dart';

part 'auth_result.freezed.dart';


//rode no terminal flutter pub run build_runner build depois de criar rdds class


@freezed
class AuthResult with _$AuthResult {
  const factory AuthResult.success(UserModel user) = Success;
  const factory AuthResult.error(String message) = Error;
}
