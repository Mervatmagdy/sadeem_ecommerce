import 'package:ecommerce/features/categories/domain/entities/category_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_list_category.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates>{
  CategoryCubit():super(CategoryLoading());
  dynamic categories = [];
  String? selectedCategory;
  eitherFailureOrCategory() async {
    emit(CategoryLoading());
    final failureOrUser = await GetListGategory().call();
    failureOrUser.fold((failure) {
      emit(CategoryError(errorMessage:failure.errMessage));
    }, (list) {
      categories = list.categories;
      categories.insert(0, "All Products");
      selectedCategory = categories.isNotEmpty ? categories.first : null;
      emit(CategorySuccess(categoryList:list ));
    });
  }
  void selectCategory(String category) {
    selectedCategory = category;
    emit(CategorySuccess(categoryList: CategoryEntity(categories: categories)));
  }
}

