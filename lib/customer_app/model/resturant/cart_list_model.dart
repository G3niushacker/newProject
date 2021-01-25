import 'package:json_annotation/json_annotation.dart';
part 'cart_list_model.g.dart';

@JsonSerializable()
class CartListModel{
  String itemName;
  String itemQty;
  int itemPrice;
  CartListModel({this.itemName,this.itemQty,this.itemPrice});
  factory CartListModel.fromJson(Map<String, dynamic> json) =>
      _$CartListModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartListModelToJson(this);
}