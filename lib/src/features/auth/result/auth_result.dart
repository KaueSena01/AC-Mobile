import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:atlas_coins/src/features/auth/model/auth_model.dart';

part 'auth_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult.success(AuthModel auth) = Success;
  factory AuthResult.error(String error) = Error;
}
