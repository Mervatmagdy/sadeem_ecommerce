import 'package:ecommerce/features/cart/domain/entities/sub_entity/cart_products_entity.dart';

class DeleteCartEntity {
  final num id;
  final List<CartProductsEntity> products;
  final num total;
  final num discountedTotal;
  final num userId;
  final num totalProducts;
  final num totalQuantity;
  final bool isDeleted;
  final String deletedOn;
  DeleteCartEntity({
    required this.total,
    required this.products,
    required this.id,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
    required this.isDeleted,
    required this.deletedOn,
  });
}
