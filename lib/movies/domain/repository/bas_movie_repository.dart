import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception_remote_data-base.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_use_case.dart';

abstract class BasMovieRepository {

  Future<Either<ExceptionRemoteDateBase, List<Movie>>> getNowPlaying () ;

  Future<Either<ExceptionRemoteDateBase, List<Movie>>> getPopular() ;

  Future<Either<ExceptionRemoteDateBase, List<Movie>>> getTopRate () ;

  Future<Either<ExceptionRemoteDateBase, MovieDetails>> getMovieDetails (MovieDetailsParameters parameters) ;

  Future<Either<ExceptionRemoteDateBase, List<Recommendation>>> getRecommendation (RecommendationParameter parameter) ;

}