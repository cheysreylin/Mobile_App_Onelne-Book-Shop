
import 'package:flutter/material.dart';
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
                color: Color.fromARGB(255, 204, 204, 204), borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                decoration: InputDecoration(
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
                    SingleChildScrollView(
                      child: Container(
                        height: 900,
                        // color: Colors.grey,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                                  child: Text("Recommendation",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 122, 122, 122)
                                  ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: book_list.length,
                                itemBuilder: ((context, index) {
                                  Books model = book_list[index];
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 250,
                                            margin: EdgeInsets.all(10),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              child: Container(
                                                child: Image.asset(model.image),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 170,
                                            height: 100,
                                            // color: Colors.amber,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(model.book_title),
                                                    ],
                                                  ),
                                                  Row(
                                                     mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(model.author_name),
                                                    ],
                                                  ), 
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(model.description, overflow: TextOverflow.visible,),
                                                    ],
                                                  ),
                                                
                                                  Row(
                                                     mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text((model.price).toString()),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                }
                              )),
                            ),    

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  // margin: const EdgeInsets.fromLTRB(0, 0, 0, 135),
                                  padding: const EdgeInsets.fromLTRB(12, 22, 0, 20),
                                  child: Text("Popular",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 122, 122, 122)
                                  ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: book_list.length,
                                itemBuilder: ((context, index) {
                                  Books model = book_list[index];
                                  return Container(
                                    margin: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 150,
                                            padding: EdgeInsets.only(left: 20),
                                            // margin: EdgeInsets.all(10),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                              child: Container(
                                                child: Image.asset(model.image),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 170,
                                            height: 100,
                                            // color: Colors.amber,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(model.book_title),
                                                    ],
                                                  ),
                                                  Row(
                                                     mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(model.author_name),
                                                    ],
                                                  ), 
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      
                                                    ],
                                                  ),
                                                
                                                  Row(
                                                     mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text((model.price).toString()),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: (){}, 
                                                        child: Text("Details")
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                }
                              )),
                            ),       
                          ],
                        ),               
                      ),
                    ),
                  Container(
                    child: Text("2"),
                  ),
                  Container(
                    child: Text("3"),
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