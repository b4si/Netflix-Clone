import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_sample/domain/core/api_end_points.dart';
import 'package:netflix_sample/domain/hot_and_new/model/hot_and_new_resp/hot_and_new.dart';
import 'package:netflix_sample/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_sample/domain/hot_and_new/model/hot_and_new_service.dart';

@LazySingleton(as: HotandNewService)
class HotAndNewImplementation implements HotandNewService {
  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndNewMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNew>> getHotAndNewTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNew.fromJson(response.data);

        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
