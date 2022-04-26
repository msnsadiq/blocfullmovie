import 'package:finalblocmovie/Model%20Classes/TvDetailModel.dart';
import 'package:finalblocmovie/bloc%20tv%20details/tv_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TvDetailsPage extends StatefulWidget {
   TvDetailsPage({Key? key,required this.id}) : super(key: key);
String id;
  @override
  State<TvDetailsPage> createState() => _TvDetailsPageState();
}

class _TvDetailsPageState extends State<TvDetailsPage> {
  final imagepathurl = 'https://image.tmdb.org/t/p/w185';
  late TvDetailModel tvDetailModel;
  bool isloading = false;
  bool tappp = false;
  @override
  void initState() {
    BlocProvider.of<TvDetailBloc>(context).add(FetchTvDetail(id: widget.id));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<TvDetailBloc, TvDetailState>(
            builder: (context, state) {
              if (state is TvDetailLoading) {
                return Center(
                  child: LinearProgressIndicator(
                    minHeight: 7,
                  ),
                );
              }
              if (state is TvDetailLoaded) {
                tvDetailModel =
                    BlocProvider.of<TvDetailBloc>(context).tvDetailModel;
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1554050857-c84a8abdb5e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGJsYWNrJTIwYmFja2dyb3VuZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                          fit: BoxFit.fill)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        tvDetailModel.name != null
                            ? SizedBox(
                          width: 350,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(33, 19, 0, 0),
                            child: Text(
                              tvDetailModel.name.toString(),
                              style: GoogleFonts.bevan(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                            : SizedBox(),
                        tvDetailModel.runtimeType != null
                            ? SizedBox(
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
                            child: Text(
                              "RunTime:  " +
                                  tvDetailModel.runtimeType.toString() +
                                  "m",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                            : SizedBox(),
                        tvDetailModel.originalLanguage != null
                            ? SizedBox(
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(33, 0, 0, 0),
                            child: Text(
                              "language:  " +
                                  tvDetailModel.originalLanguage
                                      .toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                            : SizedBox(),
                        tvDetailModel.posterPath != null
                            ? Padding(
                          padding:
                          EdgeInsets.only(top: 38, left: 15, right: 15),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .40,
                            width: double.infinity,
                            child: Card(
                              child: Image.network(
                                imagepathurl +
                                    tvDetailModel.posterPath .toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                            : SizedBox(),
                        tvDetailModel.posterPath != null
                            ? Card(
                          elevation: 19,
                          color: Colors.blueGrey,
                          child: Text(
                            tvDetailModel.name.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                            : SizedBox(),
                        tvDetailModel.overview != null
                            ? SizedBox(
                          width: 350,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 5, 0),
                            child: Text(tvDetailModel.overview.toString(),
                                style: TextStyle(color: Colors.white),
                                maxLines: isloading ? null : 2,
                                overflow: isloading
                                    ? TextOverflow.visible
                                    : TextOverflow.ellipsis),
                          ),
                        )
                            : SizedBox(),
                        tvDetailModel.overview != null
                            ? TextButton(
                          onPressed: () {
                            setState(() {
                              isloading = !isloading;
                            });
                          },
                          child: Text(isloading ? "show less" : "show more"),
                        )
                            : SizedBox(),
                        tvDetailModel.voteAverage != null
                            ? Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: SizedBox(
                            height: 30,
                            width: 350,
                            child: Padding(
                              padding: EdgeInsets.only(left: 26),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.imdb,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    tvDetailModel.voteAverage.toString() +
                                        "/10",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
//Icon(FontAwesomeIcons.star,color: Colors.blue,size: 18,),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        tappp = !tappp;
                                      });
                                    },
                                    icon: tappp
                                        ? Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20,
                                    )
                                        : Icon(
                                      FontAwesomeIcons.star,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                  ),
                                  Text(
                                    "Rate",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 21),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                            : SizedBox(),
                        tvDetailModel.posterPath != null
                            ? Padding(
                          padding: EdgeInsets.only(top: 48),
                          child: SizedBox(
                            height: 30,
                            width: 250,
                            child: Card(
                              color: Colors.grey,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Text(
                                    "Add to Watchlist",
                                    style: GoogleFonts.rubikBeastly(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                            : SizedBox(),
                        tvDetailModel.posterPath != null
                            ? Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    await launch("https://www.facebook.com");
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.facebook,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    await launch("https://www.instagram.com");
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.instagram,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    await launch(
                                        'https://twitter.com/i/flow/login?input_flow_data=%7B%22requested_variant%22%3A%22eyJsYW5nIjoiZW4ifQ%3D%3D%22%7D');
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    await launch('https://www.youtube.com/');
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.youtube,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        )
                            : SizedBox()
                      ],
                    ),
                  ),
                );
              }
              if(state is TvDetailError){
                return RefreshIndicator(
                  onRefresh: () async {
                    // BlocProvider.of<TvDetailBloc>(context)
                    //     .add(FetchingDetailMovie(id: widget.id));
                    BlocProvider.of<TvDetailBloc>(context).add(FetchTvDetail(id: widget.id));
                  },
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * 1.1,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset("assets/lost/error.jpg")),
                    ),
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  // BlocProvider.of<TvDetailBloc>(context)
                  //     .add(FetchingDetailMovie(id: widget.id));
                  BlocProvider.of<TvDetailBloc>(context).add(FetchTvDetail(id: widget.id));
                },
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 1.1,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset("assets/lost/error.jpg")),
                  ),
                ),
              );
            }),
      ),
    );
  }
}






















