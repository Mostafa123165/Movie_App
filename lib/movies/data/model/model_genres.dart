import 'package:movies_app/movies/domain/entities/Genres.dart';

class ModelGenres extends Genres {
  const ModelGenres({required super.id, required super.name});

  factory ModelGenres.fromJson(Map<String, dynamic> json) =>
      ModelGenres(
          id: json["id"],
        name: json["name"],
      );
}
