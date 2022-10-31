class AppConstants {

  // Movie Constants

  static const String apiKey = "3aec870d69da3e3ce435e0ef6195d0e9" ;

  static const String paseUrl = "https://api.themoviedb.org/3" ;

  static const String nowPlayingMoviePath = "$paseUrl/movie/now_playing?api_key=$apiKey" ;

  static  String recommendationPath(int id ) =>  "$paseUrl/movie/$id/recommendations?api_key=$apiKey" ;

  static const String popularMoviePath = "$paseUrl/movie/popular?api_key=$apiKey" ;

  static const String topRatedMoviePath = "$paseUrl/movie/top_rated?api_key=$apiKey" ;

  static const String pathImageUrl = "https://image.tmdb.org/t/p/w500/";

  static String imageUrl(String path) => "$pathImageUrl$path";

  static String movieDetailsPath(int movieId) => "$paseUrl/movie/$movieId?api_key=$apiKey" ;
}

// https://api.themoviedb.org/3/movie/717728/recommendations?api_key=3aec870d69da3e3ce435e0ef6195d0e9