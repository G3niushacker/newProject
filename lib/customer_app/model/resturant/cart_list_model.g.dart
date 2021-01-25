// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartListModel _$CartListModelFromJson(Map<String, dynamic> json) {
  return CartListModel(
    itemName: json['itemName'] as String,
    itemQty: json['itemQty'] as String,
    itemPrice: json['totalPrice'] as int,
  );
}

Map<String, dynamic> _$CartListModelToJson(CartListModel instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'itemQty': instance.itemQty,
      'totalPrice': instance.itemPrice,
    };
