import 'package:finalblocmovie/ApiItem/apiitem.dart';
import 'package:finalblocmovie/bloc/tmdb_bloc.dart';
import 'package:finalblocmovie/ui%20pages/moviepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  ApiItem apiItem = ApiItem();
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context)=>TmdbBloc(apiItem))],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MovieWood',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MoviePage(),
      ),
    );
  }
}


