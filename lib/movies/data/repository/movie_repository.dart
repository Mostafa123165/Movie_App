
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception_remote_data-base.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/repository/bas_movie_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_use_case.dart';

class MovieRepository extends BasMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<ExceptionRemoteDateBase, List<Movie>>> getNowPlaying() async {
    var result = await baseMovieRemoteDataSource.getNowPlayingMovie();
    try {
      return Right(result);
    } on ExceptionRemoteDateBase catch (e) {
      return Left(
          ExceptionRemoteDateBase(errorMessageModel: e.errorMessageModel));
    }
  }
  @override
  Future<Either<ExceptionRemoteDateBase, List<Movie>>> getPopular() async {
    var result = await baseMovieRemoteDataSource.getPopularMovie();
    try {
      return Right(result);
    } on ExceptionRemoteDateBase catch (e) {
      return Left(
          ExceptionRemoteDateBase(errorMessageModel: e.errorMessageModel));
    }
  }

  @override
  Future<Either<ExceptionRemoteDateBase, List<Movie>>> getTopRate() async {
    var result = await baseMovieRemoteDataSource.getTopRatingMovie();
    try {
      return Right(result);
    } on ExceptionRemoteDateBase catch (e) {
      return Left(
          ExceptionRemoteDateBase(errorMessageModel: e.errorMessageModel));
    }
  }

  @override
  Future<Either<ExceptionRemoteDateBase, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    var result = await baseMovieRemoteDataSource.getDetailsMovie(parameters);
    try {
      return Right(result);
    } on ExceptionRemoteDateBase catch (e) {
      return Left(
          ExceptionRemoteDateBase(errorMessageModel: e.errorMessageModel));
    }
  }

  @override
  Future<Either<ExceptionRemoteDateBase, List<Recommendation>>> getRecommendation(RecommendationParameter parameter) async{
    var result =await baseMovieRemoteDataSource.getRecommendation(parameter);

    try {
      return Right(result);
    }
    on ExceptionRemoteDateBase catch(e) {
      return Left(
          ExceptionRemoteDateBase(errorMessageModel: e.errorMessageModel));
    }
  }
}
