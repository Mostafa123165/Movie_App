import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/components/now_playing_components.dart';
import 'package:movies_app/movies/presentation/components/popular_components.dart';
import 'package:movies_app/movies/presentation/components/top_rated_components.dart';
import 'package:movies_app/movies/presentation/screens/see_more_popular_screen.dart';
import 'package:movies_app/movies/presentation/screens/see_more_top_rated_screen.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const NowPlayingComponents(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10
                ),
                child: Row(
                  children: [
                    const Text(
                      'Top Rated',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SeeMoreTopRatedScreen()));
                      },
                      child: const Text(
                        'See More',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponents(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10
                ),
                child: Row(
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SeeMorePopularScreen()));
                      },
                      child: const Text(
                        'See More',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponents(),
            ],
          ),
        ),
      ),
    );
  }
}
