import 'package:finalblocmovie/ui%20pages/MixedHomepage.dart';
import 'package:finalblocmovie/ui%20pages/moviepage.dart';
import 'package:finalblocmovie/ui%20pages/tvshowpage.dart';
import 'package:flutter/material.dart';
ValueNotifier<int> indexChanging = ValueNotifier(0);
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
return ValueListenableBuilder(valueListenable: indexChanging, builder: (context, int newIndex,_){
  return Scaffold(
    backgroundColor: Colors.black,
    bottomNavigationBar: BottomNavigationBar(
        currentIndex: newIndex,
        //fixedColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        backgroundColor: Colors.black,
        onTap: (value){
          indexChanging.value = value;
          pageController.animateToPage(value, duration: Duration(milliseconds: 500), curve: Curves.linear);
        },
        items:

        [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie),label: "Movies"),
          BottomNavigationBarItem(icon: Icon(Icons.tv),label: "Tv Shows")

        ]),
    body: PageView(
      controller: pageController,
      onPageChanged: (pageValue){
        indexChanging.value = pageValue;
      },
      children: [
        MixedHome(),
        MoviePage(),
        TvShowPage()
      ],
    ),
  );
});


  }
}
