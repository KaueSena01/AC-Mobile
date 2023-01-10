// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      title: json['title'] as String?,
      type: json['type'] as int?,
      paymentOption: json['paymentOption'] as int?,
      value: (json['value'] as num?)?.toDouble(),
      date: json['date'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'paymentOption': instance.paymentOption,
      'value': instance.value,
      'date': instance.date,
      'description': instance.description,
    };
