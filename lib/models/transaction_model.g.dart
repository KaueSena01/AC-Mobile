// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      date: json['date'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'value': instance.value,
    };
