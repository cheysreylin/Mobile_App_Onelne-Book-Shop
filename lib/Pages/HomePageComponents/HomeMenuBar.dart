
import 'package:flutter/material.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/Author/author.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/forYou.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/TopChart/topChart.dart';

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:DefaultTabController(
            length: 3, 
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 10,
                backgroundColor: Colors.white,
                bottom: TabBar(
               
                  // isScrollable: true,
                  // unselectedLabelColor: Colors.grey,
                  // indicatorColor: Colors.white,
                  // indicatorSize: TabBarIndicatorSize.label,
                  // indicator: BoxDecoration(
                  //   color: Colors.white
                  // ),
                  tabs: [
                    Tab(icon: TextButton(onPressed: (){}, child: Text("For You"))),
                    Tab(icon: TextButton(onPressed: (){}, child: Text("Top Chart")),),
                    Tab(icon: TextButton(onPressed: (){}, child: Text("Author")),),
                  ]
                ),
              ),
              body: TabBarView(
                children: [
                    Container(
                      child: ForYou(),
                    ),
                    Container(
                      child: TopChart(),
                    ),
                    Container(
                      child: Author(),
                    ),
                ]
             ),
            )
          ),
      )
    
    );
  }
}