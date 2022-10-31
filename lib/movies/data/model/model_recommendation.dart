import 'package:movies_app/movies/domain/entities/recommendations.dart';

class ModelRecommendation extends Recommendation {
  const ModelRecommendation({required super.id, required super.backdropPath});

  factory ModelRecommendation.fromJson(Map<String , dynamic > json) => ModelRecommendation(
    id:json['id'] ,
    backdropPath:json['backdrop_path'] ?? "/zmpvhQQ8HcwwD1MujPZIEpT92GW.jpg" ,
  );
}