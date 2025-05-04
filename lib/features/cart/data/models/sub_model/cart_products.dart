import 'package:ecommerce/features/cart/domain/entities/sub_entity/cart_products_entity.dart';

/// id : 168
/// title : "Charger SXT RWD"
/// price : 32999.99
/// quantity : 3
/// total : 98999.97
/// discountPercentage : 13.39
/// discountedTotal : 85743.87
/// thumbnail : "https://cdn.dummyjson.com/products/images/vehicle/Charger%20SXT%20RWD/thumbnail.png"

class Products extends CartProductsEntity{
  Products({
    required super.id,
    required super.title,
    required super.price,
    required super.quantity,
    required super.total,
    required super.discountPercentage,
    required super.discountedTotal,
    required super.thumbnail,});

  factory Products.fromJson(dynamic json) {
    return Products(
    id : json['id']??0,
    title : json['title']??0,
    price : json['price']??0,
    quantity : json['quantity']??0,
    total : json['total']??0,
    discountPercentage : json['discountPercentage']??0,
    discountedTotal : json['discountedTotal']??0,
    thumbnail : json['thumbnail']??0,
    );
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['quantity'] = quantity;
    map['total'] = total;
    map['discountPercentage'] = discountPercentage;
    map['discountedTotal'] = discountedTotal;
    map['thumbnail'] = thumbnail;
    return map;
  }

}