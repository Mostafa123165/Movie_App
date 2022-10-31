import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/exception_remote_data-base.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/repository/bas_movie_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation> , RecommendationParameter> {

  final BasMovieRepository basMovieRepository ;

  GetRecommendationUseCase(this.basMovieRepository);

  @override
  Future<Either<ExceptionRemoteDateBase, List<Recommendation>>> call(RecommendationParameter parameters) async{
    return await basMovieRepository.getRecommendation(parameters);
  }


}

class RecommendationParameter extends Equatable{
  final int id ;

  const RecommendationParameter({required this.id});

  @override
  List<Object?> get props => [
    id,
  ];

}