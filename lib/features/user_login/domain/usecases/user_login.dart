import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class UserLogin{
  final  userRepository=GetIt.instance<UserRepository>();
  Future<Either<Failure,UserEntity>>call({required username ,required password}){
    return userRepository.userLogin(username:username ,password:password );

  }
}