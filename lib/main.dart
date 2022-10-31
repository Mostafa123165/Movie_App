
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/dio.dart';
import 'package:movies_app/movies/presentation/screens/movie_screen.dart';

import 'movies/presentation/controller/movie_block.dart';
import 'movies/presentation/controller/movie_events.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await DioHelper.init() ;
    ServicesLocator.init() ;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) => sl<MovieBlock>()..add(GetNowPlayingEvents())..add(GetPopularEvents())..add(GetTopRatedEvents()),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black
        ),
        debugShowCheckedModeBanner: false,
        home: const MovieScreen() ,
      ),
    );
  }
}

