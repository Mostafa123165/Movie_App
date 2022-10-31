import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception_remote_data-base.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/bas_movie_repository.dart';

class GetPopularMovieUseCase extends BaseUseCase<List<Movie> , NoParameters>{

  final BasMovieRepository basMovieRepository ;

  GetPopularMovieUseCase(this.basMovieRepository);

  @override
  Future<Either<ExceptionRemoteDateBase, List<Movie>>> call(NoParameters parameters) async{
    return await basMovieRepository.getPopular() ;
  }

}