import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_result.freezed.dart';

@freezed
class TransactionResult<T> with _$TransactionResult<T> {
  factory TransactionResult.success(T transaction) = Success;
  factory TransactionResult.error(String error) = Error;
}
