import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/Genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath ;
  final int id ;
  final String overview ;
  final String title ;
  final double voteAverage ;
  final String releaseDate ;
  final int runtime ;
  final List<Genres> genres;

  const MovieDetails(
      {
      required this.backdropPath,
      required this.id,
      required this.overview,
      required this.title,
      required this.voteAverage,
      required this.releaseDate,
      required this.runtime,
      required this.genres,
      });

  @override
  List<Object?> get props => [
    backdropPath,
    id ,
    overview,
    title,
    voteAverage,
    releaseDate,
    runtime,
    genres,
  ];

}