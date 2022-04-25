import 'package:finalblocmovie/ApiItem/apiitem.dart';
import 'package:finalblocmovie/Model%20Classes/TrendingMovieModel.dart';
import 'package:finalblocmovie/bloc/tmdb_bloc.dart';
import 'package:finalblocmovie/ui%20pages/movieDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
 late TrendingMovieModel trendingMovieModel;
 final imagepathurl = 'https://image.tmdb.org/t/p/w185';

  @override
  void initState() {
    BlocProvider.of<TmdbBloc>(context).add(FetchingTrendingMovie());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TmdbBloc,TmdbState>(builder: (context, state) {
        if(state is TmdbLoaded){
          trendingMovieModel = BlocProvider.of<TmdbBloc>(context).trendingMovieModel;
          return RefreshIndicator(
            onRefresh: ()async{
              BlocProvider.of<TmdbBloc>(context).add(FetchingTrendingMovie());

            },
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: trendingMovieModel.results!.length,
                itemBuilder: (ctx,index){
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MovieDetails(id: trendingMovieModel.results![index].id.toString())));
                },
                child: Card(
                  child: Image.network(imagepathurl+trendingMovieModel.results![index].posterPath.toString(),fit: BoxFit.fill,),
                ),
              );
                }),
          );
        }
        if(state is TmdbLoading){
          return Center(child: CircularProgressIndicator());
        }
        if(state is TmdbError){
          return RefreshIndicator(

            onRefresh: ()async{
              BlocProvider.of<TmdbBloc>(context).add(FetchingTrendingMovie());
            },
            child: SingleChildScrollView(

              child: Container(
                height: MediaQuery.of(context).size.height*1.1,
                width: MediaQuery.of(context).size.width,

                child:Align(
                  alignment: Alignment.topCenter,
                    child: Image.asset("assets/lost/error.jpg")),
            ),
            ),
          );
        }
        return RefreshIndicator(

          onRefresh: ()async{
            BlocProvider.of<TmdbBloc>(context).add(FetchingTrendingMovie());
          },
          child: SingleChildScrollView(

            child: Container(
              height: MediaQuery.of(context).size.height*1.1,
              width: MediaQuery.of(context).size.width,

              child:Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/lost/error.jpg")),
            ),
          ),
        );
      }));

  }
}
