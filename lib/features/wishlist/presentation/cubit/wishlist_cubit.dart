// wishlist_cubit.dart
import 'package:ecommerce/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../products/domain/entities/product_entity.dart';
import '../../../products/domain/entities/sub_entities/Single_product_entity.dart';


class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  final List<SingleProductEntity> _wishlist = [];

  List<SingleProductEntity> get wishlist => List.unmodifiable(_wishlist);

  void toggleWishlist(SingleProductEntity product) {
    final exists = _wishlist.any((item) => item.id == product.id);
    if (exists) {
      _wishlist.removeWhere((item) => item.id == product.id);
    } else {
      _wishlist.add(product);
    }
    emit(WishlistUpdated(List.from(_wishlist)));
  }

  bool isWishlisted(int id) {
    return _wishlist.any((item) => item.id == id);
  }
}
