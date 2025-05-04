import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/products/data/models/sub_models/single_product_model.dart';
import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository{
Future<Either<Failure,List<SingleProductEntity>>> getAllProducts();
Future<Either<Failure,List<SingleProductEntity>>> getProductsByCategory({required String categoryName});
Future<Either<Failure,SingleProductEntity>> getSingleProduct({required int productId});

}