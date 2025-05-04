class CartProductsEntity {
  final num id;
  final String title;
  final num price;
   num quantity;
  final num total;
  final num discountPercentage;
  final num discountedTotal;
  final String thumbnail;

  CartProductsEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });
}
