import 'package:dartz/dartz.dart';
import 'package:netflix_sample/domain/core/failures/main_failures.dart';
import 'package:netflix_sample/domain/search/model/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  });
}
