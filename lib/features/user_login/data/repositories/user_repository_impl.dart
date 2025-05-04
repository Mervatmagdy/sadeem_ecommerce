

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expentions.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/connection/network_info.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_local_data_source.dart';
import '../data_sources/user_remote_data_source.dart';

class UserRepositoryImpl extends UserRepository{
  final networkInfo=GetIt.instance<NetworkInfo>();
  final userRemoteDataSource=GetIt.instance<UserRemoteDataSource>();
  final userLocalDataSource=GetIt.instance<UserLocalDataSource>();
  @override
  Future<Either<Failure, UserEntity>> userLogin({required username, required password})async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await userRemoteDataSource.userLogin(username:username,password: password);
        userLocalDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await userLocalDataSource.getLastUser();
        return Right(localUser as UserEntity);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }}