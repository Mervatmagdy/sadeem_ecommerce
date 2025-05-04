import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../entities/sub_entities/Single_product_entity.dart';
import '../repositories/product_repository.dart';

class GetProductByCategory{
  final productRepository=GetIt.instance<ProductRepository>();
  Future<Either<Failure,List<SingleProductEntity>>>call({required String categoryName}){
    return productRepository.getProductsByCategory(categoryName: categoryName);
  }
}