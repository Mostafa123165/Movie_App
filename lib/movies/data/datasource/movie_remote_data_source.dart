import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception_remote_data-base.dart';
import 'package:movies_app/core/utils/constances.dart';
import 'package:movies_app/dio.dart';
import 'package:movies_app/movies/data/model/model_movie.dart';
import 'package:movies_app/movies/data/model/model_movie_details.dart';
import 'package:movies_app/movies/data/model/model_recommendation.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_use_case.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<ModelMovie>> getNowPlayingMovie();

  Future<List<ModelMovie>> getTopRatingMovie();

  Future<List<ModelMovie>> getPopularMovie();

  Future<ModelMovieDetails> getDetailsMovie(MovieDetailsParameters parameters);
  
  Future<List<Recommendation>> getRecommendation(RecommendationParameter parameters);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<ModelMovie>> getNowPlayingMovie() async {
    final response =
        await DioHelper.getData(path: AppConstants.nowPlayingMoviePath);

    if (response.statusCode == 200) {
      return List<ModelMovie>.from((response.data["results"] as List)
          .map((e) => ModelMovie.fromJson(e)));
    } else {
      throw ExceptionRemoteDateBase(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<ModelMovie>> getPopularMovie() async {
    final response = await Dio().get(AppConstants.popularMoviePath);

    if (response.statusCode == 200) {
      return List<ModelMovie>.from((response.data["results"] as List)
          .map((e) => ModelMovie.fromJson(e)));
    } else {
      throw ExceptionRemoteDateBase(errorMessageModel: response.data);
    }
  }


  @override
  Future<List<ModelMovie>> getTopRatingMovie() async {
    final response = await Dio().get(AppConstants.topRatedMoviePath);

    if (response.statusCode == 200) {
      return List<ModelMovie>.from((response.data["results"] as List).map((e) => ModelMovie.fromJson(e)));
    } else {
      throw ExceptionRemoteDateBase(errorMessageModel: response.data);
    }
  }

  @override
  Future<ModelMovieDetails> getDetailsMovie(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(AppConstants.movieDetailsPath(parameters.movieId));

    if (response.statusCode == 200) {

      return ModelMovieDetails.fromJson(response.data);
    } else {
      throw ExceptionRemoteDateBase(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<ModelRecommendation>> getRecommendation(RecommendationParameter parameters) async{
    final response = await Dio().get(AppConstants.recommendationPath(parameters.id));
    if(response.statusCode == 200) {
      return List<ModelRecommendation>.from(( response.data['results'] as List).map((e) => ModelRecommendation.fromJson(e)));
    }
    else {
      throw ExceptionRemoteDateBase(errorMessageModel: response.data);
    }
  }
  
}
