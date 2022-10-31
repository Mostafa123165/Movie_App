import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/exception_remote_data-base.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/bas_movie_repository.dart';

  class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails , MovieDetailsParameters > {
  final BasMovieRepository basMovieRepository;

  GetMovieDetailsUseCase(this.basMovieRepository);

  @override
  Future<Either<ExceptionRemoteDateBase, MovieDetails>> call(MovieDetailsParameters parameters) async{
    return await basMovieRepository.getMovieDetails(parameters);
  }

}

class MovieDetailsParameters extends Equatable {
  final int movieId ;

  const MovieDetailsParameters({
    required this.movieId,
});

  @override
  List<Object?> get props =>[
    movieId,
  ];
}
