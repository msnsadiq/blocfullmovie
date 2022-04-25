import 'package:finalblocmovie/ui%20pages/searchPad.dart';
import 'package:flutter/material.dart';

class MixedHome extends StatefulWidget {
  const MixedHome({Key? key}) : super(key: key);

  @override
  State<MixedHome> createState() => _MixedHomeState();
}

class _MixedHomeState extends State<MixedHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 35,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SearchPage()));
          }, icon: Icon(Icons.search,color: Colors.white,))
        ],
      ),
    );
  }
}
