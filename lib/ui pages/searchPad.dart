//import 'dart:html';

import 'package:finalblocmovie/Model%20Classes/SrarchAll.dart';
import 'package:finalblocmovie/bloc%20search%20items/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
   SearchPage({Key? key,}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final imagepathurl = 'https://image.tmdb.org/t/p/w185';
  late SrarchAll searchall;
  @override
  void initState() {
   //BlocProvider.of<SearchBloc>(context).add(FetchSearch(widget.query));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: ConstrainedBox(
        constraints:
        BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 25),
    child: Container(
    color: Colors.white,
    child: TextField(
    onChanged: (value) {
   // searchMovieProvider.searchMovieWork(context, value);
      BlocProvider.of<SearchBloc>(context).add(FetchSearch(value));
    },
    autofocus: true,
    decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.white, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.white, width: 2.0),
    ),
    hintText: 'Which movie do you like?',
    hintStyle: TextStyle(color: Colors.black)),
    ),
    ),
    ),
      BlocBuilder<SearchBloc,SearchState>(builder: (context,state){
        if(state is SearchLoading){
          Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is SearchLoaded){
          searchall = BlocProvider.of<SearchBloc>(context).searchall;
          ListView.builder(
          itemCount: searchall.results!.length
          ,

          itemBuilder: (ctx,index){
         return   Card(
             child: Image.network(imagepathurl+searchall.results![index].posterPath.toString(),fit: BoxFit.fill,),
            );
          });
        }
        return Center(
          child: Text("other state"),
        );
      })
    ]
    ),
    ),
    ),
    );
  }
}
