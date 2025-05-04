import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';

import '../entities/category_entity.dart';

abstract class CategoryRepository{
  Future<Either<Failure,CategoryEntity>> getListCategories();
}