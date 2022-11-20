import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_sample/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_sample/domain/downloads/models/downloads.dart';
import 'package:netflix_sample/domain/search/model/search_resp/search_resp.dart';
import 'package:netflix_sample/domain/search/search_service.dart';

import '../../domain/core/failures/main_failures.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;

  SearchBloc(
    this._searchService,
    this._downloadsService,
  ) : super(SearchState.initial()) {
/*
idle state
*/

    on<Initialize>(
      (event, emit) async {
        if (state.idleList.isNotEmpty) {
          emit(
            SearchState(
              searchResultList: [],
              idleList: state.idleList,
              isLoading: false,
              isError: false,
            ),
          );
          return;
        }

        //get trending
        final _results = await _downloadsService.getDownloadsImages();
        final _state = _results.fold((MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        }, (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        });
        //show to ui
        emit(_state);
      },
    );

/*
search result state
*/

    on<SearchMovie>((event, emit) async {
      //call search movie api
      emit(
        SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: true,
          isError: false,
        ),
      );
      final _result = await _searchService.searchMovies(
        movieQuery: event.movieQuery,
      );
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResp r) {
          return SearchState(
            searchResultList: r.results!,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );

      //show to ui
      emit(_state);
    });
  }
}
