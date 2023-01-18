import 'package:flutter/material.dart';
import 'package:projecttesting/home_screen/Components/Author/author.dart';
import 'package:projecttesting/home_screen/Components/ForYou/forYou.dart';
import 'package:projecttesting/home_screen/Components/TopChart/topChart.dart';
import 'package:projecttesting/provider/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false, 
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            elevation: 0,
            title: Container(
              width: double.infinity,
              // height:15,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238), borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
                  iconColor: Colors.grey,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.clear),
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: (){

              }, 
              icon: Icon(Icons.camera), color: Colors.grey,)
            ],
          ),
          
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
          ),
        )
      );
  }
}