
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';

class MovieDetailsState extends Equatable{
  final MovieDetails? modelMovieDetails;
  final String movieDetailsMessage;
  final RequestState movieDetailsState;
  final List<Recommendation> recommendationModel ;
  final String recommendationMessage;
  final RequestState recommendationState;


  const MovieDetailsState({
     this.modelMovieDetails ,
     this.movieDetailsMessage = '',
     this.movieDetailsState = RequestState.loading,
     this.recommendationMessage='',
     this.recommendationState = RequestState.loading,
     this.recommendationModel = const [],
  });

  MovieDetailsState copyWith({
    MovieDetails? modelMovieDetails,
    String? movieDetailsMessage,
    RequestState? movieDetailsState,
    List<Recommendation>? recommendationModel ,
    String? recommendationMessage ,
    RequestState? recommendationState,

  }) =>
      MovieDetailsState(
        modelMovieDetails: modelMovieDetails ?? this.modelMovieDetails,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        recommendationModel: recommendationModel ?? this.recommendationModel,
        recommendationMessage: recommendationMessage ?? this.recommendationMessage,
        recommendationState: recommendationState ?? this.recommendationState,
      );

  @override
  List<Object?> get props => [
    modelMovieDetails ,
    movieDetailsMessage ,
    movieDetailsState,
    recommendationModel,
    recommendationState,
    recommendationMessage,
  ];


}
