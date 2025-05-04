import 'package:ecommerce/features/cart/domain/entities/delete_cart_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cart_entity.dart';
import '../../domain/usecases/add_To_Cart.dart';
import '../../domain/usecases/delete_cart.dart';
import '../../domain/usecases/get_cart_by_userId.dart';
import '../../domain/usecases/update_cart.dart';
import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  dynamic currentCart;


  getCartByUserId({required int userId}) async {
    emit(CartLoadingState());
    final result = await GetCartByUserId().call(userId: userId);

    result.fold(
          (failure) => emit(CartErrorState(failure.errMessage)),
          (cart) {
        currentCart = cart;
        emit(CartSuccessState(cart));
      },
    );
  }
  List<Map<String, dynamic>> carts = [];

  addToCart({
    required int userId,
    required List<Map<String, dynamic>> products,
    required String quantity ,
  }) async {
    emit(CartLoadingState());

    for (var newProduct in products) {
      int existingIndex = carts.indexWhere((element) => element['id'] == newProduct['id']);
      if(quantity == 'minus'){
        carts[existingIndex]['quantity'] = newProduct['quantity'];
      }
      if(quantity == 'plus'){
        carts[existingIndex]['quantity'] = newProduct['quantity'];
      } else {
        // If it's a new product, add it
        carts.add(newProduct);
      }
    }

    final result = await AddToCart().call(userId: userId, products: carts);

    result.fold(
          (failure) => emit(CartErrorState(failure.errMessage)),
          (cart) {
        currentCart = cart;
        emit(CartSuccessState(cart));
      },
    );
  }


  deleteCart({required int cartId}) async {
    emit(CartLoadingState());

    final result = await DeleteCart().call(cartId: cartId);

    result.fold(
          (failure) => emit(CartErrorState(failure.errMessage)),
          (deletedCart) {
        print('Cart deleted: $deletedCart');
        carts.clear();       // Clear local cart list
        currentCart = null;  // Reset currentCart

        emit(CartDeletedState()); // You can create this state
      },
    );
  }


  }
