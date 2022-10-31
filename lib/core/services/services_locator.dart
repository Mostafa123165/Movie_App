
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/bas_movie_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movie_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movie_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_block.dart';
import 'package:movies_app/movies/presentation/controller/moviedetails_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {

  static void init(){
    /// Bloc
    sl.registerFactory(() => MovieBlock(sl() , sl() , sl() )) ; // create new object from cubit
    sl.registerFactory(() => MovieDetailsBloc(sl() , sl())) ;


    /// UseCase
    sl.registerLazySingleton(() => GetNowPlayingMovieUseCase(sl())) ;

    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl())) ;

    sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl())) ;

    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl())) ;

    sl.registerLazySingleton(() => GetRecommendationUseCase(sl())) ;



    /// BaseMovieRepository
    sl.registerLazySingleton<BasMovieRepository>(() => MovieRepository(sl())) ;

    /// DateSource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource()) ;

  }

}