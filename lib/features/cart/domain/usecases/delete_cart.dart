import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';
import '../entities/delete_cart_entity.dart';
import '../repositories/cart_repository.dart';

class DeleteCart{
  final CartRepository cartRepository=GetIt.instance<CartRepository>();

  Future<Either<Failure,DeleteCartEntity>>call({required int cartId}){
    return cartRepository.deleteCart(cartId: cartId);
  }


}