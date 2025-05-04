import 'package:ecommerce/features/products/data/models/sub_models/review_model.dart';
import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';

import 'dimension_model.dart';
import 'meta_model.dart';

class SingleProducts extends SingleProductEntity{
  SingleProducts({
    super.id,
    super.title,
    super.description,
    super.category,
    super.price,
    super.discountPercentage,
    super.rating,
    super.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    required super.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    super.images,
    this.thumbnail,});

  factory SingleProducts.fromJson(dynamic json) {
    List<Reviews> parsedReviews = [];
    if (json['reviews'] != null) {
      json['reviews'].forEach((v) {
        parsedReviews.add(Reviews.fromJson(v));
      });
    }

    return SingleProducts(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      stock: json['stock'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : [],
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
      dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null,
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: parsedReviews,
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      images: json['images'] != null ? List<String>.from(json['images']) : [],
      thumbnail: json['thumbnail'],
    );
  }

  List<String>? tags;
  String? brand;
  String? sku;
  num? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;

  String? returnPolicy;
  num? minimumOrderQuantity;
  Meta? meta;

  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['category'] = category;
    map['price'] = price;
    map['discountPercentage'] = discountPercentage;
    map['rating'] = rating;
    map['stock'] = stock;
    map['tags'] = tags;
    map['brand'] = brand;
    map['sku'] = sku;
    map['weight'] = weight;
    if (dimensions != null) {
      map['dimensions'] = dimensions?.toJson();
    }
    map['warrantyInformation'] = warrantyInformation;
    map['shippingInformation'] = shippingInformation;
    map['availabilityStatus'] = availabilityStatus;
    if (reviews != null) {
      map['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    map['returnPolicy'] = returnPolicy;
    map['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    map['images'] = images;
    map['thumbnail'] = thumbnail;
    return map;
  }

}