import 'package:dartz/dartz.dart';
import 'package:netflix_sample/domain/core/failures/main_failures.dart';
import 'package:netflix_sample/domain/hot_and_new/model/hot_and_new_resp/hot_and_new.dart';

abstract class HotandNewService {
  Future<Either<MainFailure, HotAndNew>> getHotAndNewMovieData();
  Future<Either<MainFailure, HotAndNew>> getHotAndNewTvData();
}
