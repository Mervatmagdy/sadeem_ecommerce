import 'package:ecommerce/features/products/domain/entities/sub_entities/Single_product_entity.dart';

class ProductEntity{
  List<SingleProductEntity>? products;
  num? total;
  num? skip;
  num? limit;
  ProductEntity({required this.products,required this.total, required this.skip,required this.limit});
}