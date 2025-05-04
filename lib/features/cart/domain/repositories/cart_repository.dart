import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/cart_entity.dart';
import '../entities/delete_cart_entity.dart';

abstract class CartRepository{
  Future<Either<Failure, CartEntity>> addToCart({
    required int userId,
    required List<Map<String, dynamic>> products, // List of {id, quantity}
  });

  Future<Either<Failure, CartEntity>> getCartByUserId({required int userId});

  Future<Either<Failure, CartEntity>> updateCart({
    required int cartId,
    required List<Map<String, dynamic>> updatedProducts,
  });

  Future<Either<Failure, DeleteCartEntity>> deleteCart({required int cartId});
}