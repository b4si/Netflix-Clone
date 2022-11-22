import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_sample/domain/core/failures/main_failures.dart';
import 'package:netflix_sample/domain/hot_and_new/model/hot_and_new_service.dart';

import '../../domain/hot_and_new/model/hot_and_new_resp/hot_and_new.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotandNewService _hotandNewService;
  HotAndNewBloc(this._hotandNewService) : super(HotAndNewState.initial()) {
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui

      emit(
        const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: true,
            hasError: false),
      );

      //get data from remote
      final _result = await _hotandNewService.getHotAndNewMovieData();

      //get and hot and new movie data

      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNew resp) {
        return HotAndNewState(
          comingSoonList: resp.results!,
          everyOneIsWatchingList: state.everyOneIsWatchingList,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });

    on<LoadDataInEveryoneIsWatching>((event, emit) async {
      //send loading to ui

      emit(
        const HotAndNewState(
            comingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: true,
            hasError: false),
      );

      //get data from remote
      final _result = await _hotandNewService.getHotAndNewTvData();

      //get and hot and new tv data

      final newState = _result.fold((MainFailure failure) {
        return const HotAndNewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          hasError: true,
        );
      }, (HotAndNew resp) {
        return HotAndNewState(
          comingSoonList: state.comingSoonList,
          everyOneIsWatchingList: resp.results!,
          isLoading: false,
          hasError: false,
        );
      });
      emit(newState);
    });
  }
}
