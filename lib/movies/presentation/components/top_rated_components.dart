import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/constances.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movie_block.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';
import 'package:movies_app/movies/presentation/screens/details_screen.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedComponents extends StatelessWidget {
  const TopRatedComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MovieBlock, MovieState>(
      buildWhen: (previous, current) => previous.topRatedState != current.topRatedState,

      builder: (context, state) {

        switch (state.topRatedState) {
          case RequestState.loading:
            return const SizedBox(
                height: 130, child: Center(child: CircularProgressIndicator()));
          case RequestState.loaded:
            return SizedBox(
              height: 130,
              child: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailsScreen(id:state.topRatedMovie[index].id)));
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 100,
                          imageUrl:  AppConstants.imageUrl(state.topRatedMovie[index].backdropPath),
                          placeholder: (context , url ) => Shimmer.fromColors(
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
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 8,
                    ),
                    itemCount: state.topRatedMovie.length,
                  )),
            );
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
