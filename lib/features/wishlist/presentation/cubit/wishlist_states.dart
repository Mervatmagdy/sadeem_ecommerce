import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';

import '../../../products/domain/entities/product_entity.dart';
import '../../domain/entities/wishlist_entity.dart';

abstract class WishlistState {}
class WishlistInitial extends WishlistState {}
class WishlistUpdated extends WishlistState {
  final List<SingleProductEntity> wishlist;
  WishlistUpdated(this.wishlist);
}

