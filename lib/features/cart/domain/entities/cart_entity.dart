import 'package:ecommerce/features/cart/domain/entities/sub_entity/cart_products_entity.dart';

class CartEntity {
  final num id;
  final List<CartProductsEntity> products;
  final num total;
  final num discountedTotal;
  final num userId;
  final num totalProducts;
  final num totalQuantity;

  CartEntity({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });
}
