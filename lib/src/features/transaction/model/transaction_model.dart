import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  String? title;
  int? type;
  int? paymentOption;
  double? value;
  String? date;
  String? description;

  TransactionModel({
    this.title,
    this.type,
    this.paymentOption,
    this.value,
    this.date,
    this.description,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  transactionValue() => value;
}
