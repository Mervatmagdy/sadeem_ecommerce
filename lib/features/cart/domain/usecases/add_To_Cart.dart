import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:get_it/get_it.dart';

import '../entities/cart_entity.dart';
import '../repositories/cart_repository.dart';

class AddToCart{
  final CartRepository cartRepository=GetIt.instance<CartRepository>();
  Future<Either<Failure,CartEntity>> call({ required int userId,
    required List<Map<String, dynamic>> products,}){
    return cartRepository.addToCart(userId: userId, products: products);

  }

}