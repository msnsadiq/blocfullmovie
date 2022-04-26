import 'package:finalblocmovie/Model%20Classes/TvShowModel.dart';
import 'package:finalblocmovie/bloc%20tvshows/bloc_tv_shows_bloc.dart';
import 'package:finalblocmovie/ui%20pages/tv_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TvShowPage extends StatefulWidget {
  const TvShowPage({Key? key}) : super(key: key);

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> {
 late  TvShowModel tvShowModel;
 final imagepathurl = 'https://image.tmdb.org/t/p/w185';
  @override
  void initState() {
    BlocProvider.of<TvShowsBloc>(context).add(FetchTvShows());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          leadingWidth: 4,
          toolbarHeight: 20,
          title:  Text("Tv Shows",
              style: GoogleFonts.alegreya(color: Colors.redAccent)
          ),
          backgroundColor: Colors.black,
          actions: [
            const Icon(
              Icons.tv,
              size: 20,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.9,
            )
          ],
        ),
      backgroundColor: Colors.black,
      body: BlocBuilder<TvShowsBloc,TvShowsState>(builder: (context, state) {
        if(state is TvShowsLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is TvShowsLoaded){
          tvShowModel = BlocProvider.of<TvShowsBloc>(context).tvShowModel;
          return RefreshIndicator(
            onRefresh: ()async{
              BlocProvider.of<TvShowsBloc>(context).add(FetchTvShows());
            },
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: tvShowModel.results!.length,
                itemBuilder: (ctx, index){
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TvDetailsPage(id: tvShowModel.results![index].id.toString())));
                },
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.red,
                  child: Image.network(imagepathurl+tvShowModel.results![index].posterPath.toString(),fit: BoxFit.fill,),
                ),
              );
                }),
          );
        }
        if(state is TvShowsError){
          return RefreshIndicator(
            onRefresh: ()async{
              BlocProvider.of<TvShowsBloc>(context).add(FetchTvShows());
            },
            child: SingleChildScrollView(

              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height*1.1,
                width: MediaQuery.of(context).size.width,

                child:Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/lost/error.jpg"),),
              ),
            ),
          );
        }
        return RefreshIndicator(
          onRefresh: ()async{
            BlocProvider.of<TvShowsBloc>(context).add(FetchTvShows());
          },
          child: SingleChildScrollView(

            child: Container(
              color: Colors.white,
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
