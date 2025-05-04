import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetAllProducts{
  final ProductRepository productRepository=GetIt.instance<ProductRepository>();
  Future<Either<Failure,List<SingleProductEntity>>>call(){
    return productRepository.getAllProducts();
  }

}