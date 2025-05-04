import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/core/params/params.dart';

import '../entities/user_entity.dart';

abstract class UserRepository{
Future<Either<Failure,UserEntity>> userLogin({required String username,required String password});
}