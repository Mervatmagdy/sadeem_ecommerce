import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';

import '../../domain/entities/product_entity.dart';

abstract class ProductStates{}
class ProductLoadingStates extends ProductStates{}
class ProductSuccessStates extends ProductStates{
  final List<SingleProductEntity> products;
  // final SingleProductEntity singleProduct;
  ProductSuccessStates({required this.products});
}
class ProductErrorStates extends ProductStates{
  final String errMessage;
  ProductErrorStates(this.errMessage);
}
