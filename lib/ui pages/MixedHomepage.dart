import 'package:finalblocmovie/Model%20Classes/TrendingMovieModel.dart';
import 'package:finalblocmovie/Model%20Classes/TvShowModel.dart';
import 'package:finalblocmovie/bloc%20tv%20details/tv_detail_bloc.dart';
import 'package:finalblocmovie/bloc%20tvshows/bloc_tv_shows_bloc.dart';
import 'package:finalblocmovie/bloc/tmdb_bloc.dart';
import 'package:finalblocmovie/ui%20pages/searchPad.dart';
import 'package:finalblocmovie/ui%20pages/tv_detail_page.dart';
import 'package:finalblocmovie/ui%20pages/tvshowpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MixedHome extends StatefulWidget {
  const MixedHome({Key? key}) : super(key: key);

  @override
  State<MixedHome> createState() => _MixedHomeState();
}

class _MixedHomeState extends State<MixedHome> {
  final String imageurl = "https://image.tmdb.org/t/p/w500/";
  late TvShowModel tvShowModel;
  late TrendingMovieModel trendingMovieModel;
  @override
  void initState() {
    BlocProvider.of<TvShowsBloc>(context).add(FetchTvShows());
    BlocProvider.of<TmdbBloc>(context).add(FetchingTrendingMovie());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("TMDB",style: GoogleFonts.bevan(color: Colors.redAccent),),
        backgroundColor: Colors.black,
        toolbarHeight: 35,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchPage()));
          }, icon: Icon(Icons.search,color: Colors.white,))
        ],
      ),
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints){
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                title: Text("Tv Shows",style: TextStyle(color: Colors.white),

                ),
                trailing: IconButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TvShowPage()));
                }, icon: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,)),
              ),
              SizedBox(
                height: 200,
                child: BlocBuilder<TvShowsBloc,TvShowsState>(builder: (context, state) {
                  if(state is TvShowsLoading){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(state is TvShowsLoaded){
                   tvShowModel = BlocProvider.of<TvShowsBloc>(context).tvShowModel;
                   return ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: tvShowModel.results!.length,


                       itemBuilder: (ctx, index){
                         return  GestureDetector(
                           onTap: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TvDetailsPage(id: tvShowModel.results![index].id.toString())));
                           },
                           child: Card(
                             elevation: 20,
                             child: Image.network(imageurl+tvShowModel.results![index].posterPath.toString(),fit: BoxFit.fill,),
                             shadowColor: Colors.red,
                           ),
                         );
                       });
                  }
                  if(state is TvDetailError){
                    return Center(child: Text("site error"),);
                  }
                  return Center(child: Text("state error"),);
                }),
              ),
              ListTile(
                title: Text("Movies",style: TextStyle(color: Colors.white),

                ),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,)),
              )
            ],
          ),
          ),
        );
      }),
    );
  }
}


//                     ListTile(
//                       title: Text(
//                         "Movies",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       trailing: IconButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (ctx) => ScreenHome()));
//                         },
//                         icon: Icon(
//                           Icons.keyboard_arrow_down_outlined,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     provider.loading
//                         ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                         : GridView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         // scrollDirection: Axis.vertical,
//                         gridDelegate:
//                         SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 3,
//                             mainAxisSpacing: 5,
//                             crossAxisSpacing: 5),
//                         itemCount:
//                         provider.trendingModel.results!.length,
//                         itemBuilder: (ctx, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                       builder: (ctx) => ScreenTwo(
//                                           id: provider.trendingModel
//                                               .results![index].id
//                                               .toString())));
//                             },
//                             child: Card(
//                               child: Image.network(
//                                 imageurl +
//                                     provider.trendingModel
//                                         .results![index].posterPath
//                                         .toString(),
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           );
//                         }),
//
//                   ],
//                 ),
//               ),
//             );
//           },
//
//         ));
//   }
// }