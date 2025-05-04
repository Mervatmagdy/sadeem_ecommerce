import 'package:ecommerce/features/categories/data/model/category_model.dart';
import 'package:ecommerce/features/categories/domain/entities/category_entity.dart';

abstract class CategoryStates{}
class CategoryLoading extends CategoryStates{}
class CategorySuccess extends CategoryStates{
  final  CategoryEntity categoryList;
  CategorySuccess({required this.categoryList});
}
class CategoryError extends CategoryStates{
 final String errorMessage;
  CategoryError({required this.errorMessage});
}

