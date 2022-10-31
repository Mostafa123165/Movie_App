import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/core/utils/reusable_components.dart';
import 'package:movies_app/movies/presentation/controller/movie_block.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';
import 'package:movies_app/movies/presentation/screens/details_screen.dart';

class SeeMorePopularScreen extends StatelessWidget {
  const SeeMorePopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBlock, MovieState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text(
              AppString.popularMovie,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: ListView.separated(
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailsScreen(id:state.popularMovie[index].id)));
                  },
                    child: popularTopRatedMovie(state.popularMovie[index])
                ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 0,
            ),
            itemCount: state.popularMovie.length,
          ),
        );
      },
    );
  }
}
