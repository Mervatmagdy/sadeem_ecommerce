import 'package:dartz/dartz.dart';
import 'package:ecommerce/features/categories/domain/repositories/category_repository.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';
import '../entities/category_entity.dart';

class GetListGategory{

  final  categoryRepository=GetIt.instance<CategoryRepository>();
Future<Either<Failure,CategoryEntity>> call(){
  return categoryRepository.getListCategories();

}
}