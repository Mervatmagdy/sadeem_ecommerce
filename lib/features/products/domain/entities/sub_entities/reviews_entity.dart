class ReviewsEntity {
  num? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;
  ReviewsEntity({
    required this.comment,
    required this.date,
    required this.rating,
    required this.reviewerEmail,
    required this.reviewerName,
  });
}
