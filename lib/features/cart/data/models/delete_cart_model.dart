import 'package:ecommerce/features/cart/data/models/sub_model/cart_products.dart';

import '../../domain/entities/delete_cart_entity.dart';

/// id : 1
/// products : [{"id":168,"title":"Charger SXT RWD","price":32999.99,"quantity":3,"total":98999.97,"discountPercentage":13.39,"discountedTotal":85743.87,"thumbnail":"https://cdn.dummyjson.com/products/images/vehicle/Charger%20SXT%20RWD/thumbnail.png"},{"id":78,"title":"Apple MacBook Pro 14 Inch Space Grey","price":1999.99,"quantity":2,"total":3999.98,"discountPercentage":18.52,"discountedTotal":3259.18,"thumbnail":"https://cdn.dummyjson.com/products/images/laptops/Apple%20MacBook%20Pro%2014%20Inch%20Space%20Grey/thumbnail.png"},{"id":183,"title":"Green Oval Earring","price":24.99,"quantity":5,"total":124.94999999999999,"discountPercentage":6.28,"discountedTotal":117.1,"thumbnail":"https://cdn.dummyjson.com/products/images/womens-jewellery/Green%20Oval%20Earring/thumbnail.png"},{"id":100,"title":"Apple Airpods","price":129.99,"quantity":5,"total":649.95,"discountPercentage":12.84,"discountedTotal":566.5,"thumbnail":"https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20Airpods/thumbnail.png"}]
/// total : 103774.85
/// discountedTotal : 89686.65
/// userId : 33
/// totalProducts : 4
/// totalQuantity : 15
/// isDeleted : true
/// deletedOn : "2025-05-04T04:01:44.630Z"

class DeleteCartModel extends DeleteCartEntity{
  DeleteCartModel({
      required super.id,
    required super.products,
    required super.total,
    required super.discountedTotal,
    required super.userId,
    required super.totalProducts,
    required super.totalQuantity,
    required super.isDeleted,
    required super.deletedOn,});

  factory DeleteCartModel.fromJson(dynamic json) {
    List<Products> productList = [];
    if (json['products'] != null) {
      productList = (json['products'] as List)
          .map((v) => Products.fromJson(v))
          .toList();
    }

    return DeleteCartModel(
      id: json['id'],
      products: productList,
      total: json['total'],
      discountedTotal: json['discountedTotal'],
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
      isDeleted: json['isDeleted'],
      deletedOn: json['deletedOn'],
    );
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['products'] = products?.map((v) => (v as Products).toJson()).toList();
    map['total'] = total;
    map['discountedTotal'] = discountedTotal;
    map['userId'] = userId;
    map['totalProducts'] = totalProducts;
    map['totalQuantity'] = totalQuantity;
    map['isDeleted'] = isDeleted;
    map['deletedOn'] = deletedOn;
    return map;
  }

}

