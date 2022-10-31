abstract class MovieEvents {
  const MovieEvents() ;
}


class GetNowPlayingEvents extends MovieEvents {}

class GetPopularEvents extends MovieEvents {}

class GetTopRatedEvents extends MovieEvents {}