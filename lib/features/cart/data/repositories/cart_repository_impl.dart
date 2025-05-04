import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/features/cart/domain/entities/delete_cart_entity.dart';
import 'package:ecommerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/expentions.dart';
import '../../../../core/errors/failure.dart';
import '../data_sources/cart_remote_data_source.dart';

class CartRepositoryImpl extends CartRepository{
  final CartRemoteDataSource cartRemoteDataSource=GetIt.instance<CartRemoteDataSource>();
  final NetworkInfo networkInfo=GetIt.instance<NetworkInfo>();
  @override
  Future<Either<Failure, CartEntity>> addToCart({required int userId, required List<Map<String, dynamic>> products})async {
  if(await networkInfo.isConnected!){
    try{
      final response=await cartRemoteDataSource.addToCart(userId: userId, products: products);
      return Right(response);
    }on ServerException catch(e){
      return Left(Failure(errMessage:e.errorModel.errorMessage));
    }
  }else{
    return Left(Failure(errMessage: "No internet connection"));
  }
  }

  @override
  Future<Either<Failure, DeleteCartEntity>> deleteCart({required int cartId})async {
    if(await networkInfo.isConnected!){
      try{
        final response=await cartRemoteDataSource.deleteCart(cartId: cartId);
        return Right(response);
      }on ServerException catch(e){
        return Left(Failure(errMessage:e.errorModel.errorMessage));
      }
    }else{
      return Left(Failure(errMessage: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCartByUserId({required int userId})async {
    if(await networkInfo.isConnected!){
      try{
        final response=await cartRemoteDataSource.getCartByUserId(userId: userId);
        return Right(response);
      }on ServerException catch(e){
        return Left(Failure(errMessage:e.errorModel.errorMessage));
      }
    }else{
      return Left(Failure(errMessage: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> updateCart({required int cartId, required List<Map<String, dynamic>> updatedProducts})async {
    if(await networkInfo.isConnected!){
      try{
        final response=await cartRemoteDataSource.updateCart(cartId: cartId, updatedProducts: updatedProducts);
        return Right(response);
      }on ServerException catch(e){
        return Left(Failure(errMessage:e.errorModel.errorMessage));
      }
    }else{
      return Left(Failure(errMessage: "No internet connection"));
    }
  }

}