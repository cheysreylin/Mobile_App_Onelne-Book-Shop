
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/Author/components/authorDetailPage.dart';
import 'package:projecttesting/model/AllAuthor/AuthorDetail.dart';
import 'package:projecttesting/model/AuthorMonth/authorMonth.dart';
import 'package:projecttesting/model/AuthorWeek/authorWeek.dart';
import 'package:projecttesting/model/TopSellAuthor/topSellAuthor.dart';
import 'package:projecttesting/model/api.dart';

import '../../../../../settings/settings_controller.dart';

class Author extends StatelessWidget {
  //const Author({super.key});
  const Author({Key? key, required this.settingsController}) : super(key: key);
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: 940,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: 
            [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 12, 0, 12),
                    child: Text("Top Sell",
                    style: new TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 99, 99, 99)
                        )
                      ),
                  ),
                ],
              ), 
              Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: AuthorList.length,
                itemBuilder: ((context, index) {
                  AllAuthor author = AuthorList[index];
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                      onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => AuthorDetail(authordetails: author,))));
                      }),
                      child: Card(
                        elevation: 7,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Container(
                          height: 70,
                          width: 130,
                          //color: Colors.amber,
                          margin: EdgeInsets.all(7),
                          child: ClipRRect(
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.all(7),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(author.image)
                                      ),
                                  )
                                ),
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            //color: Colors.amber,
                                            child: 
                                              Center(
                                                child: Text(author.name,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: new TextStyle(
                                                      fontSize: 12.5,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color.fromARGB(255, 129, 129, 129)
                                                    )
                                                ),
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
                        ),
                      ),
                    ),
                  );
                }
              )),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 12, 0, 12),
                    child: Text("Top Authors of this Week",
                    style: new TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 99, 99, 99)
                        )
                      ),
                  ),
                ],
              ), 
              Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: AuthorList.length,
                itemBuilder: ((context, index) {
                  AllAuthor author = AuthorList[index];
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                       onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => AuthorDetail(authordetails: author,))));
                      }),
                      child: Card(
                        elevation: 7,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Container(
                          height: 70,
                          width: 130,
                          //color: Colors.amber,
                          margin: EdgeInsets.all(7),
                          child: ClipRRect(
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.all(7),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(author.image)
                                      ),
                                  )
                                ),
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            //color: Colors.amber,
                                            child: 
                                              Center(
                                                child: Text(author.name,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: new TextStyle(
                                                      fontSize: 12.5,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color.fromARGB(255, 129, 129, 129)
                                                    )
                                                ),
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
                        ),
                      ),
                    ),
                  );
                }
              )),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 12, 0, 12),
                    child: Text("Top Authors of this Month",
                    style: new TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 99, 99, 99)
                        )
                      ),
                  ),
                ],
              ), 
              Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: AuthorList.length,
                itemBuilder: ((context, index) {
                  AllAuthor author = AuthorList[index];
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                       onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => AuthorDetail(authordetails: author,))));
                      }),
                      child: Card(
                        elevation: 7,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Container(
                          height: 70,
                          width: 130,
                          //color: Colors.amber,
                          margin: EdgeInsets.all(7),
                          child: ClipRRect(
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.all(7),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(author.image)
                                      ),
                                  )
                                ),
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            //color: Colors.amber,
                                            child: 
                                              Center(
                                                child: Text(author.name,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: new TextStyle(
                                                      fontSize: 12.5,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color.fromARGB(255, 129, 129, 129)
                                                    )
                                                ),
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
                        ),
                      ),
                    ),
                  );
                }
              )),
              ),

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(12, 12, 0, 12),
                    child: Text("All the Authors",
                    style: new TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 99, 99, 99)
                        )
                      ),
                  ),
                ],
              ), 
              Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: AuthorList.length,
                itemBuilder: ((context, index) {
                  AllAuthor author = AuthorList[index];
                  return Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    padding: EdgeInsets.all(1),
                    child: GestureDetector(
                       onTap: (() {
                            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => AuthorDetail(authordetails: author,))));
                      }),
                      child: Card(
                        elevation: 7,
                        color: Color.fromARGB(255, 255, 255, 255),
                        child: Container(
                          height: 70,
                          width: 130,
                          //color: Colors.amber,
                          margin: EdgeInsets.all(7),
                          child: ClipRRect(
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.all(7),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(author.image)
                                      ),
                                  )
                                ),
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100,
                                            //color: Colors.amber,
                                            child: 
                                              Center(
                                                child: Text(author.name,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: new TextStyle(
                                                      fontSize: 12.5,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color.fromARGB(255, 129, 129, 129)
                                                    )
                                                ),
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
                        ),
                      ),
                    ),
                  );
                }
              )),
              ),
            ],
          ),               
        )
      ),
    );
  }
}