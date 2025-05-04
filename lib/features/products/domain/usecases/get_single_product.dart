import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';
import '../entities/sub_entities/Single_product_entity.dart';
import '../repositories/product_repository.dart';

class GetSingleProduct{
  final productRepository=GetIt.instance<ProductRepository>();
  Future<Either<Failure,SingleProductEntity>>call({required int productId}){
    return productRepository.getSingleProduct(productId: productId);
  }

}