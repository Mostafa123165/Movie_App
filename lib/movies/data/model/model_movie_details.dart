import 'package:movies_app/movies/data/model/model_genres.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class ModelMovieDetails extends MovieDetails {
  const ModelMovieDetails(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.title,
      required super.voteAverage,
      required super.releaseDate,
      required super.runtime,
      required super.genres});

  factory ModelMovieDetails.fromJson(Map<String, dynamic> json) =>
      ModelMovieDetails(
          backdropPath: json["backdrop_path"],
          id: json["id"],
          overview: json["overview"],
          title: json["title"],
          voteAverage: json["vote_average"],
          releaseDate: json["release_date"],
          runtime: json["runtime"],
          genres: List<ModelGenres>.from(
            json["genres"].map((x) => ModelGenres.fromJson(x)),
          ));
}
