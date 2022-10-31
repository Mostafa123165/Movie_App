import 'package:movies_app/movies/data/model/model_genres.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class ModelMovie extends Movie {
  const ModelMovie({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.voteAverage,
    required super.overview,
    required super.genreIds,
    required super.releaseDate,
  });

  factory ModelMovie.fromJson(Map<String, dynamic> json) => ModelMovie(
        id: json["id"],
        backdropPath: json["backdrop_path"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        genreIds: List<int>.from(
            json["genre_ids"].map((e) => e)),
        releaseDate: json["release_date"],
      );
}
