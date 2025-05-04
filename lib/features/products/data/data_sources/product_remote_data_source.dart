import 'package:ecommerce/features/products/data/models/sub_models/single_product_model.dart';
import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/databases/api/api_consumer.dart';
import '../../../../core/databases/api/end_points.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource{
final api = GetIt.instance<ApiConsumer>();
Future<List<SingleProductEntity>> getAllProducts() async {
  final response = await api.get(EndPoints.products);
  print("API Response: $response"); // Debug print

  if (response['products'] != null) {
    final products = (response['products'] as List)
        .map((json) => SingleProducts.fromJson(json))
        .toList();
    return products;
  } else {
    return []; // Return empty list if 'products' is null
  }
}

 getProductsByCategory({required String categoryName}) async {
  final response = await api.get("${EndPoints.productGategory}/$categoryName");

  final products = (response['products'] as List)
      .map((json) => SingleProducts.fromJson(json))
      .toList();

  return products;
}
getSingleProduct({required int productId})async{
  final response=await api.get("${EndPoints.products}/$productId");
  return response;

}
}