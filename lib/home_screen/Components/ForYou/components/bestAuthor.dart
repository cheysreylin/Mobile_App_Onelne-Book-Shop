import 'package:flutter/material.dart';
import 'package:projecttesting/provider/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BestAuthor extends StatelessWidget {
  const BestAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                child: Text("Best Author",
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
          Row(
            children: 
            [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 160.0,
                      height: 160.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage
                          (
                            fit: BoxFit.fill,
                            image: new NetworkImage("https://i.imgur.com/BoN9kdC.png")
                          )
                      )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: 
                          Text("Adam Victorie",
                          style: new TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 66, 66, 66)
                              )
                          ),
                      ),
                    ],
                  ), 
                ],
              ),
              Container(
                width: 180,
                height: 120,
                color: Color.fromARGB(0, 100, 100, 100),
                child:
                  Text(
                    'So please, oh please, we beg, we pray, go throw your TV set away, and in its place you can install a lovely bookshelf on the wall.', 
                    softWrap: true,
                    maxLines: 13,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 66, 66, 66)
                    )
                  ),
              ),
            ]
          ),

          Column(
            children: [
              // Their Work part 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                    child: Text("Their Works",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 70, 70, 70)
                    ),
                    ),
                  ),
                ],
              ),
              Container(
                child: SingleChildScrollView(
                  child: Container(
                    height: 220,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: book_list.length,
                            itemBuilder: ((context, index) {
                              Books model = book_list[index];
                              return Container(
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                child: ClipRRect(
                                  child: Column(
                                    children: [
                                      Container(
                                        // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                                        height: 160,
                                        width: 165,
                                        child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: Container(
                                          child: Image.asset(model.image),
                                        ),),
                                      ),
                                      SizedBox(height: 10,),
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
                                                          fontSize: 15.5,
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
                          )
                        ),
                      ), 
                    ],
                  ),
                ),
              )
              )                 
            ],
          ),
          Divider(thickness: 5.0,),
          Column(
            children: [
              // News
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Text("News",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 70, 70, 70)
                    ),
                    ),
                  ),
                ],
              ),
              Container(
                child: SingleChildScrollView(
                  child: Container(
                    height: 440,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: book_list.length,
                            itemBuilder: ((context, index) {
                              Books model = book_list[index];
                              return Container(
                                padding: EdgeInsets.fromLTRB(5, 25, 0, 0),
                                child: ClipRRect(
                                  child: Row(
                                    children: [
                                      Container(
                                        // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                                        height: 190,
                                        width: 190,
                                        child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: Container(
                                          child: Image.asset(model.image),
                                        ),),
                                      ),
                                      Container(
                                        // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                                        height: 190,
                                        width: 185,
                                        child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: Container(
                                          child: Image.asset(model.image),
                                        ),),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          )
                        ),
                      ), 
                    ],
                  ),
                ),
              )
              )                 
            ],
          ),
        ],
      ),
    );
  }
}