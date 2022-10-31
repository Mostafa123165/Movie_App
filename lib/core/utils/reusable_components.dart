import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/utils/constances.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:shimmer/shimmer.dart';

Widget popularTopRatedMovie (Movie movie) =>Padding(
  padding: const EdgeInsets.all(7.0),
  child: Container(
    width: double.infinity,
    height: 165,
    color: Colors.white10,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 100,
              height: 165,
              fit: BoxFit.cover,
              imageUrl:
              AppConstants.imageUrl(movie.backdropPath),
              placeholder: (context, url) => Shimmer.fromColors(
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
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 23,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.red ,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        movie.releaseDate.substring(0,4),
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: .5,
                              fontSize: 14.0,
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
                    '3.9',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                movie.overview,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 15,
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  ),
);