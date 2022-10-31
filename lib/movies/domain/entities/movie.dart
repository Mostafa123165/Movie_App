import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String backdropPath;
  final String title;
  final double voteAverage;
  final List<int> genreIds;
  final String overview;
  final String releaseDate;

    const Movie({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.genreIds,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
    id,
    backdropPath,
    title,
    voteAverage,
    overview,
    genreIds,
    releaseDate,
  ];

}
