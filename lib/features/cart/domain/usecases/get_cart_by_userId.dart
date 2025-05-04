import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';
import '../entities/cart_entity.dart';

class GetCartByUserId{
  final CartRepository cartRepository=GetIt.instance<CartRepository>();
Future<Either<Failure,CartEntity>>call({required int userId}){
  return cartRepository.getCartByUserId(userId: userId);

}

}