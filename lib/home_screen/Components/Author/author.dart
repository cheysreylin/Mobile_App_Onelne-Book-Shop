
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projecttesting/provider/api.dart';

class Author extends StatelessWidget {
  const Author({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Container(
            height: 900,
            color: Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: 
              [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Text("Top Sell Author",
                      style: new TextStyle(
                            fontSize: 19.5,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 59, 59, 59)
                          )
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
                      margin: EdgeInsets.all(7),
                      child: ClipRRect(
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              margin: EdgeInsets.all(7),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(model.image)
                                  ),
                              )
                            ),
                            SizedBox(
                              // width: 120,
                              // height: 120,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: 
                                          Text(model.author_name,
                                          style: new TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 66, 66, 66)
                                              )
                                          ),
                                      ),
                                    ],
                                  ), 
                                  SizedBox(height: 2,),
                                ],
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
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Text("Best Author Of this Week",
                      style: new TextStyle(
                            fontSize: 19.5,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 59, 59, 59)
                          )
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
                      margin: EdgeInsets.all(7),
                      child: ClipRRect(
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              margin: EdgeInsets.all(7),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(model.image)
                                  ),
                              )
                            ),
                            SizedBox(
                              // width: 120,
                              // height: 120,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: 
                                          Text(model.author_name,
                                          style: new TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 66, 66, 66)
                                              )
                                          ),
                                      ),
                                    ],
                                  ), 
                                  SizedBox(height: 2,),
                                ],
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
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Text("Best Author of this Month",
                      style: new TextStyle(
                            fontSize: 19.5,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 59, 59, 59)
                          )
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
                      margin: EdgeInsets.all(7),
                      child: ClipRRect(
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              margin: EdgeInsets.all(7),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(model.image)
                                  ),
                              )
                            ),
                            SizedBox(
                              // width: 120,
                              // height: 120,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: 
                                          Text(model.author_name,
                                          style: new TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 66, 66, 66)
                                              )
                                          ),
                                      ),
                                    ],
                                  ), 
                                  SizedBox(height: 2,),
                                ],
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
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      child: Text("All Authors",
                      style: new TextStyle(
                            fontSize: 19.5,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 59, 59, 59)
                          )
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
                      margin: EdgeInsets.all(7),
                      child: ClipRRect(
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              margin: EdgeInsets.all(7),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(model.image)
                                  ),
                              )
                            ),
                            SizedBox(
                              // width: 120,
                              // height: 120,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: 
                                          Text(model.author_name,
                                          style: new TextStyle(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 66, 66, 66)
                                              )
                                          ),
                                      ),
                                    ],
                                  ), 
                                  SizedBox(height: 2,),
                                ],
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
          )
        )
      ),
    );
  }
}