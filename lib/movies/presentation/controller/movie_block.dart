import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movie_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_events.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';

class MovieBlock extends Bloc<MovieEvents, MovieState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;

  MovieBlock
      (
      this.getNowPlayingMovieUseCase,
      this.getTopRatedMovieUseCase,
      this.getPopularMovieUseCase
      )
      : super(const MovieState())
  {

    on<GetNowPlayingEvents>(_getNowPlaying);

    on<GetPopularEvents>(_getPopular);

    on<GetTopRatedEvents>(_getTopRated);
  }

  FutureOr<void> _getNowPlaying(
      GetNowPlayingEvents event, Emitter<MovieState> emit) async {
    final res = await getNowPlayingMovieUseCase(const NoParameters());
    res.fold(
        (l) => {
              emit(
                state.copyWith(
                  nowPlayingMessage: l.errorMessageModel.statusMessage,
                  nowPlayingState: RequestState.error,
                ),
              ),
            },
        (r) => {
              emit(
                state.copyWith(
                  nowPlayingMovie: r,
                  nowPlayingState: RequestState.loaded,
                ),
              ),
        });
  }


  FutureOr<void> _getPopular(
      GetPopularEvents event, Emitter<MovieState> emit) async {
    final res = await getPopularMovieUseCase(const NoParameters());
    res.fold(
        (l) => {
              emit(
                state.copyWith(
                  popularMessage: l.errorMessageModel.statusMessage,
                  popularState: RequestState.error,
                ),
              )
            },
        (r) => {
              emit(
                state.copyWith(
                  popularMovie: r,
                  popularState: RequestState.loaded,
                ),
              )
            });
  }


  FutureOr<void> _getTopRated(
      MovieEvents event, Emitter<MovieState> emit) async {
    final res = await getTopRatedMovieUseCase(const NoParameters());
    res.fold((l) {
      emit(
        state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.errorMessageModel.statusMessage,
        )
      );

    },
        (r) {
          emit(
            state.copyWith(
              topRatedMovie: r ,
              topRatedState: RequestState.loaded ,
            ),
          );
        });
  }
}
