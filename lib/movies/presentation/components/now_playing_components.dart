import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/dummy/dummy.dart';
import 'package:movies_app/core/utils/constances.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_block.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';
import 'package:movies_app/movies/presentation/screens/details_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/services/services_locator.dart';

class NowPlayingComponents extends StatelessWidget {
  const NowPlayingComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBlock, MovieState>(
      buildWhen: (previous, current) => previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return const SizedBox(
                height: 450, child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return FadeIn(
                duration: const Duration(
                  milliseconds: 400,
                ),
                child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400,
                      initialPage: 0,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {},
                    ),
                    items: state.nowPlayingMovie.map((e) {
                      return GestureDetector(
                        onTap: () {
                          /// TODO : NAVIGATE TO MOVIE DETAILS
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailsScreen(id:e.id)));
                        },
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    // fromLTRB
                                    Colors.transparent,
                                    Colors.black,
                                    Colors.black,
                                    Colors.transparent,
                                  ],
                                  stops: [0, 0.3, 0.5, 1],
                                ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                                );
                              },
                              blendMode: BlendMode.dstIn,
                                child: CachedNetworkImage(
                                height: 450,
                                width: double.infinity,
                                imageUrl:
                                    AppConstants.imageUrl(e.backdropPath),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 170.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 6,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'NOW PLAYING',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                 Text(
                                  e.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList()));
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
