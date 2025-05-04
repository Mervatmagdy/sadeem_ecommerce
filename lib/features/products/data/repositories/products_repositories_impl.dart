

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expentions.dart';

import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/products/data/models/product_model.dart';

import 'package:ecommerce/features/products/domain/entities/product_entity.dart';

import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/connection/network_info.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/product_remote_data_source.dart';

class ProductRepositoryImpl extends ProductRepository{
  final networkInfo=GetIt.instance<NetworkInfo>();
  final productRemoteDataSource=GetIt.instance<ProductRemoteDataSource>();
  @override
  Future<Either<Failure, List<SingleProductEntity>>> getAllProducts()async {
   if(await networkInfo.isConnected!){
  try{
    final response= await productRemoteDataSource.getAllProducts();

    return Right(response);
  }on ServerException catch(e){
    return Left(Failure(errMessage: e.errorModel.errorMessage));
  }
   }else{
     return Left(Failure(errMessage: "No internet connection"));
   }
  }

  @override
  Future<Either<Failure, List<SingleProductEntity>>> getProductsByCategory({required String categoryName})async {
   if(await networkInfo.isConnected!){
     try{
       final response= await productRemoteDataSource.getProductsByCategory(categoryName: categoryName);

       return Right(response);
     }on ServerException catch(e){
       return Left(Failure(errMessage: e.errorModel.errorMessage));
     }
   }else{
     return Left(Failure(errMessage: "No internet connection"));
   }
   }


  @override
  Future<Either<Failure, SingleProductEntity>> getSingleProduct({required int productId})async {
    if(await networkInfo.isConnected!){
      try{
        final response= await productRemoteDataSource.getSingleProduct(productId: productId);

        return Right(response);
      }on ServerException catch(e){
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    }else{
      return Left(Failure(errMessage: "No internet connection"));
    }
  }

}