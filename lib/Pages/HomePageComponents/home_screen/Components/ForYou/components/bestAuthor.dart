import 'package:flutter/material.dart';
import 'package:projecttesting/model/api.dart';
import '../../../../../DetailPage/detail.dart';

class BestAuthor extends StatelessWidget {
  const BestAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Card(
              shadowColor: Colors.black,
              elevation: 10,
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 66, 66, 66)
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
                            width: 130.0,
                            height: 130.0,
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
                          padding: EdgeInsets.only(bottom: 20),
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
                        maxLines: 20,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 63, 63, 63)
                        )
                      ),
                  ),
                ]
                ),],
              )
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
                        fontSize: 18,
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
                      height: 160,
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
                                  padding: EdgeInsets.only(top: 10),
                                  child: ClipRRect(
                                    child: GestureDetector(
                                      onTap: (() {
                                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => BookDetail(model))));
                                      }),
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 120,
                                              width: 80,
                                              child: Expanded(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                                  child: Hero(
                                                    tag: book_list[index],
                                                    child: Image.asset(
                                                      model.image,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
                  ),
                )
                )                 
              ],
            ),
            // Divider(thickness: 5.0,),
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
                      height: 600,
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
                                  padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                                  child: ClipRRect(
                                    child: Row(
                                      children: [
                                        Card(
                                          elevation: 10,
                                          child: Container(
                                            // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                                            height: 220,
                                            width: 154,
                                            child: ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                              child: Image.asset(model.image),
                                            ),),
                                          ),
                                        ),
                                        SizedBox(width: 20,),
                                        Card(
                                          elevation: 10,
                                          child: Container(
                                            // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                                            height: 220,
                                            width: 154,
                                            child: ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                              child: Image.asset(model.image),
                                            ),),
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
          ],
        ),
    );
  }
}