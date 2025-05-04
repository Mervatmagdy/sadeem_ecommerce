import 'package:ecommerce/features/cart/data/models/sub_model/cart_products.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';

import 'delete_cart_model.dart';

/// id : 1
/// products : [{"id":144,"title":"Cricket Helmet","price":44.99,"quantity":9,"total":404.91,"discountPercentage":9.64,"discountedPrice":366,"thumbnail":"https://cdn.dummyjson.com/product-images/sports-accessories/cricket-helmet/thumbnail.webp"},{"id":98,"title":"Rolex Submariner Watch","price":13999.99,"quantity":9,"total":125999.91,"discountPercentage":5.05,"discountedPrice":119637,"thumbnail":"https://cdn.dummyjson.com/product-images/mens-watches/rolex-submariner-watch/thumbnail.webp"}]
/// total : 126404.82
/// discountedTotal : 120003
/// userId : 1
/// totalProducts : 2
/// totalQuantity : 18

class CartModel extends CartEntity{
  CartModel({
      required super.id,
    required super.products,
    required super.total,
    required super.discountedTotal,
    required super.userId,
    required super.totalProducts,
    required super.totalQuantity,});

  factory CartModel.fromJson(dynamic json) {
    print("CartModel.fromJson input: $json"); // ✅ Debug

    List<Products> productList = [];
    if (json['products'] != null) {
      productList = (json['products'] as List)
          .map((item) => Products.fromJson(item))
          .toList();
    }

    return CartModel(
      id: json['id'] ?? 0,
      products: productList,
      total: json['total'] ?? 0,
      discountedTotal: json['discountedTotal'] ?? 0,
      userId: json['userId'] ?? 0,
      totalProducts: json['totalProducts'] ?? 0,
      totalQuantity: json['totalQuantity'] ?? 0,
    );
  }



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['products'] = products.map((v) => (v as Products).toJson()).toList();
    map['id'] = id;
    map['total'] = total;
    map['discountedTotal'] = discountedTotal;
    map['userId'] = userId;
    map['totalProducts'] = totalProducts;
    map['totalQuantity'] = totalQuantity;
    return map;
  }

}
