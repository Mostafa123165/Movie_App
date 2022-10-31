import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final String nowPlayingMessage;
  final RequestState nowPlayingState;
  final List<Movie> popularMovie;
  final String popularMessage;
  final RequestState popularState;
  final List<Movie> topRatedMovie;
  final String topRatedMessage;
  final RequestState topRatedState;


  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingMessage = '',
    this.nowPlayingState = RequestState.loading,
    this.popularMovie = const [],
    this.popularMessage = '',
    this.popularState = RequestState.loading,
    this.topRatedMovie = const [] ,
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '' ,
  });

  MovieState copyWith ({
     List<Movie>? nowPlayingMovie,
     String? nowPlayingMessage,
     RequestState? nowPlayingState,
     List<Movie>? popularMovie,
     String? popularMessage,
     RequestState? popularState,
    List<Movie>? topRatedMovie,
    RequestState? topRatedState,
    String? topRatedMessage,
}) {
    return MovieState(
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie ,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage ,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState ,
      popularMovie: popularMovie ?? this.popularMovie ,
      popularMessage: popularMessage ?? this.popularMessage ,
      popularState: popularState ?? this.popularState ,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedState: topRatedState ?? this.topRatedState ,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovie ,
    nowPlayingMessage ,
    nowPlayingState ,
    popularMovie,
    popularMessage,
    popularState,
    topRatedState ,
    topRatedMessage,
    topRatedMovie,
  ];

}
