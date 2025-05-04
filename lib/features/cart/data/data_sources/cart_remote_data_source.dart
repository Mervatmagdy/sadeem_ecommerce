import 'package:ecommerce/core/databases/api/api_consumer.dart';
import 'package:ecommerce/features/cart/data/models/cart_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/databases/api/end_points.dart';
import '../../domain/entities/delete_cart_entity.dart';
import '../models/delete_cart_model.dart';

class CartRemoteDataSource{
  final api=GetIt.instance<ApiConsumer>();
  Future<CartEntity> getCartByUserId({required int userId})async{
    final response=await api.get('${EndPoints.userCart}/$userId');
    final cart=CartModel.fromJson(response);
    print("cart$cart");
    return  cart;


  }
  Future<CartEntity> addToCart({required int userId,required List<Map<String, dynamic>> products,})async {
    final response = await api.post(
      EndPoints.addCart,
      data: {
        'userId': userId,
        'products': products,
      },
    );
    return CartModel.fromJson(response);

  }
  Future<CartEntity> updateCart({required int cartId,required List<Map<String, dynamic>> updatedProducts,})async{
    final response = await api.patch(
      '${EndPoints.updateCart}/$cartId',
      data: {
        'products': updatedProducts,
      },
    );
    return CartModel.fromJson(response);
  }

  Future<DeleteCartEntity> deleteCart({required int cartId})async{
    final response = await api.delete(
      '${EndPoints.deleteCart}/$cartId');
    return DeleteCartModel.fromJson(response);
  }

}