import 'package:atlas_coins/src/features/user/model/auth_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult.success(AuthModel auth) = Success;
  factory AuthResult.error(String error) = Error;
}
