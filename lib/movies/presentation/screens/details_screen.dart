import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'dart:math' as math;
import 'package:movies_app/core/utils/constances.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/presentation/controller/moviedetails_bloc.dart';
import 'package:movies_app/movies/presentation/controller/moviedetails_event.dart';
import 'package:movies_app/movies/presentation/controller/moviedetails_state.dart';
import 'package:shimmer/shimmer.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({Key? key, required this.id }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<MovieDetailsBloc>()..add(GetMovieDetailsEvents(id))..add(GetMovieRecommendationEvent(id)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          print("BlocBuilder DetailsScreen ") ;
          if(state.movieDetailsState == RequestState.loaded && state.recommendationState == RequestState.loaded) {
            return Scaffold(
              backgroundColor: Colors.black12,
              body: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverPersistentHeader(
                      floating: false,
                      pinned: false,
                      delegate: SliverAppBarDelegate(
                          maxHeight: 260.0,
                          minHeight: 260.0,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 260.0,
                                child: CachedNetworkImage(
                                  imageUrl: AppConstants.imageUrl(state.modelMovieDetails!.backdropPath),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: Container(
                                          height: 130.0,
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 25,
                                    horizontal: 10
                                ),
                                child: IconButton(onPressed: (){
                                  print('yes') ;
                                  Navigator.pop(context);
                                }, icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ))
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.modelMovieDetails!.title,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 23,
                                  width: 48,
                                  color: Colors.grey[800],
                                  child: Align(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(
                                      state.modelMovieDetails!.releaseDate.substring(0 , 4),
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                            color: Colors.white,
                                            letterSpacing: .5,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${state.modelMovieDetails!.voteAverage.roundToDouble()}',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  convertTime(state.modelMovieDetails!.runtime),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              state.modelMovieDetails!.overview,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 15,
                                  height: 1.4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'MORE LIKE THIS . ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 24.0),
                    sliver:_showRecommendations(state.recommendationModel),
                  ),
                ],
              ),
            );
          } else if(state.movieDetailsState == RequestState.error ){
            return Text(
              state.movieDetailsMessage,
            );
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget _showRecommendations(List<Recommendation> recommendationModel) {
  return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
  builder: (context, state) {
    return  SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return FadeIn(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              height: 170,
              width: 120,
              imageUrl: AppConstants.imageUrl(state.recommendationModel[index].backdropPath),
              placeholder: (context, url) =>
                  Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 170.0,
                      width: 120.0,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
        childCount: recommendationModel.length ,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  },
);
}

String convertTime(int time) {
  int hour = time ~/ 60.0 ;
  int minute = (time % 60).toInt() ;
  return '$hour h $minute m ' ;
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    // debugPrint('progress => $progress');
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      // height: progress,
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
