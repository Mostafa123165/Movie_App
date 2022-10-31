import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:movies_app/movies/presentation/controller/moviedetails_event.dart';
import 'moviedetails_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase ;
  MovieDetailsBloc(this.getMovieDetailsUseCase , this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvents>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvents event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));

    result.fold((l) {
      emit(state.copyWith(
        movieDetailsMessage: l.errorMessageModel.statusMessage,
        movieDetailsState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        movieDetailsState: RequestState.loaded,
        modelMovieDetails: r,
      ));
    });
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async {
     final result = await getRecommendationUseCase(RecommendationParameter(id: event.id));

     result.fold((l) {
       emit(
         state.copyWith(
           recommendationMessage: l.errorMessageModel.statusMessage,
           recommendationState: RequestState.error,
         )
       );
     }, (r) {
       emit(
           state.copyWith(
             recommendationModel: r ,
             recommendationState: RequestState.loaded,
           )
       );
     });
  }
}
