import '../../domain/entities/cart_entity.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  final dynamic cart; // Replace `dynamic` with your `CartEntity` or `CartModel` type
  CartSuccessState(this.cart);
}

class CartErrorState extends CartStates {
  final String error;
  CartErrorState(this.error);
}
class CartDeletedState extends CartStates {

}