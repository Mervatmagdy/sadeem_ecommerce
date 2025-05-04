import 'package:ecommerce/core/databases/api/api_consumer.dart';
import 'package:ecommerce/core/params/params.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/databases/api/end_points.dart';
import '../models/user_model.dart';

class UserRemoteDataSource{
final api = GetIt.instance<ApiConsumer>();
userLogin({required username,required password})async{
  final response=await api.post("${EndPoints.login}",isFormData: true,data: {
  'username': username,
  'password': password,
  }, );
  return  UserModel.fromJson(response);
}
}