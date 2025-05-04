import 'package:ecommerce/features/products/domain/usecases/get_all_products.dart';
import 'package:ecommerce/features/products/domain/usecases/get_product_bycategory.dart';
import 'package:ecommerce/features/products/presentation/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {


  ProductCubit() : super(ProductLoadingStates());

  String? categoryName;
  int? categoryId;
  void eitherFailureOrProducts() async {
    try {
      emit(ProductLoadingStates());
      final response = await GetAllProducts().call();

      response.fold(
            (failure) {
          emit(ProductErrorStates(failure.errMessage));
        },
            (productModelList) {
          // Flatten all products from all ProductModels into one list
          print('Total individual products fetched: ${productModelList.length}');
          emit(ProductSuccessStates(products: productModelList));
        },
      );
    } catch (e) {
      emit(ProductErrorStates(e.toString()));
    }
  }

  //
  // void eitherFailureOrProductsByCategory() async {
  //   emit(ProductLoadingStates());
  //   final failureOrProduct = await getProductByCategory.call(
  //     categoryName: categoryName ?? "All Products",
  //   );
  //   failureOrProduct.fold(
  //         (failure) => emit(ProductErrorStates(failure.errMessage)),
  //         (products) => emit(ProductSuccessStates(products: products)),
  //   );
  // }

}