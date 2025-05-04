import 'package:ecommerce/features/products/domain/entities/sub_entities/reviews_entity.dart';

/// rating : 3
/// comment : "Would not recommend!"
/// date : "2025-04-30T09:41:02.053Z"
/// reviewerName : "Eleanor Collins"
/// reviewerEmail : "eleanor.collins@x.dummyjson.com"

class Reviews extends ReviewsEntity{
  Reviews({
    required super.rating,
    required super.comment,
    required super.date,
    required super.reviewerName,
    required super.reviewerEmail,});

  factory Reviews.fromJson(dynamic json) {
    return Reviews(
    rating : json['rating'],
    comment : json['comment'],
    date : json['date'],
    reviewerName : json['reviewerName'],
    reviewerEmail : json['reviewerEmail'],
    );
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating'] = rating;
    map['comment'] = comment;
    map['date'] = date;
    map['reviewerName'] = reviewerName;
    map['reviewerEmail'] = reviewerEmail;
    return map;
  }

}