import 'package:ecommerce/core/databases/api/api_consumer.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/databases/api/end_points.dart';

class CategoryRemoteDataSource{
  final api=GetIt.instance<ApiConsumer>();
  getGategoryList()async{
    final response=await api.get(EndPoints.categories);
    return List<String>.from(response);

  }
}