import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required List<String> categories}) : super(categories: categories);

  factory CategoryModel.fromJson(List<dynamic> json) {
    return CategoryModel(
      categories: json.map((e) => e.toString()).toList(),
    );
  }
}