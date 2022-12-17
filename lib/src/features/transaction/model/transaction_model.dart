import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  int? type;
  String? title;
  String? description;
  String? date;
  double? value;

  TransactionModel({
    this.title,
    this.value,
    this.type,
    this.date,
    this.description,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  transactionValue() => value;
}
