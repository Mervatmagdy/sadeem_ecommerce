import 'package:ecommerce/features/products/data/models/sub_models/review_model.dart';
import 'package:ecommerce/features/products/domain/entities/sub_entities/reviews_entity.dart';

class SingleProductEntity {
  num? id;
  String? title;
  String? description;
  String? category;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  List<Reviews>? reviews;
  List<String>? images;
  SingleProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.reviews,
    required this.images,
  });
}
