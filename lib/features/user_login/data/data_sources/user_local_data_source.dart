import 'dart:convert';

import 'package:ecommerce/core/databases/cache/cache_helper.dart';
import 'package:ecommerce/core/errors/expentions.dart';
import 'package:get_it/get_it.dart';

import '../models/user_model.dart';

class UserLocalDataSource{
  final cache=GetIt.instance<CacheHelper>();
  final String key="user";
  cacheUser(UserModel? user){
    if(user!=null){
      cache.saveData(key:key , value:json.encode(user.toJson()));
    }else{
      throw CacheExeption(errorMessage:"No Internet Connection");
    }
  }
  Future<UserModel?> getLastUser(){
  final jsonString= cache.getDataString(key: key);
  if(jsonString!=null){
    return Future.value(UserModel.fromJson(json.decode(jsonString)));
  }else{
    throw CacheExeption(errorMessage: 'No Internet Connection');
  }
  }
}