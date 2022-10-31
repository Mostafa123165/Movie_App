
import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable{
  const MovieDetailsEvent() ;
}

class GetMovieDetailsEvents extends MovieDetailsEvent {
  final int id ;

  const GetMovieDetailsEvents(this.id,);

  @override
  List<Object?> get props => [
    id ,
  ];

}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id ;

  const GetMovieRecommendationEvent(this.id,);

  @override
  List<Object?> get props => [
    id ,
  ];

}
