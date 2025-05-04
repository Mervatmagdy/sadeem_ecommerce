import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expentions.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/features/categories/data/datasources/category_remote_data_source.dart';
import 'package:ecommerce/features/categories/data/model/category_model.dart';
import 'package:ecommerce/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce/features/categories/domain/repositories/category_repository.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/connection/network_info.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final networkInfo = GetIt.instance<NetworkInfo>();
  final categoryRemoteDataSource = GetIt.instance<CategoryRemoteDataSource>();

  @override
  Future<Either<Failure, CategoryEntity>> getListCategories() async {
    if (await networkInfo.isConnected!) {
      try {
        final rawList = await categoryRemoteDataSource.getGategoryList(); // List<String>
        final categoryModel = CategoryModel.fromJson(rawList);            // Wrap it
        return Right(categoryModel);                                      // Now valid
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: 'No Connection'));
    }
  }
}
