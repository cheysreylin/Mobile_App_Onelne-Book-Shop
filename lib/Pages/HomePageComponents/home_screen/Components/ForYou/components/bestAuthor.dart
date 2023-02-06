import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../../../../../source/Provider/bookloading.dart';

class BestAuthor extends StatefulWidget {
  BestAuthor({super.key}); 
  @override
  State<BestAuthor> createState() => _BestAuthorState();
}

class _BestAuthorState extends State<BestAuthor> {
  var AuthorBook; 
  late bool _isloading;
  int _currentPage = 0;

  @override
  void initState() {
    getcategorydata();

    super.initState();
    _isloading = true;
    Future.delayed(const Duration(seconds: 5), (){
      setState(() {
        _isloading = false;
      });
    });
    super.initState();
  }

  void getcategorydata() async {
    Response r4 = await get(Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=subject:health&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA"));
  
    setState(() {
      AuthorBook = jsonDecode(r4.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2200,
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Card(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 240, 240, 240),
              shadowColor: Color.fromARGB(255, 94, 94, 94),
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
                Column(
                  children: [
                    Row(
                      children: 
                      [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                width: 110.0,
                                height: 110.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage
                                    (
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/BestAuthor/BestAuthor.jpg")
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
                                Text("William Golding",
                                style: new TextStyle(
                                      fontSize: 14,
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
                    ],
                  ),],
                ),
              ]
            )
          ),
          
          Card(
            margin: EdgeInsets.all(10),
            color: Color.fromARGB(255, 240, 240, 240),
            shadowColor: Color.fromARGB(255, 94, 94, 94),
            elevation: 10,
            child: Container(
              height: 148,
              // margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return (
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 11.0),
                              child: Row( 
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                          return bookloading(
                                              c: AuthorBook["items"][index + 1]["volumeInfo"]
                                                  ["industryIdentifiers"][0]["identifier"]);
                                        }));
                                      },
                                      child: Row(  
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 11),
                                            height: 115,
                                            width: 85,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6),
                                              image: DecorationImage(
                                                  image: NetworkImage(AuthorBook["items"]
                                                          [index + 1]["volumeInfo"]
                                                      ["imageLinks"]["thumbnail"]),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),    
                        ],
                      )
                    );
                  }
                ),
              ),
          ),
          
          // NEW BOOKS
          Column(
            children: [
              // News
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: Text("New Books",
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
              Card(
                elevation: 5,
                child: Container(
                  height: 550,
                  margin: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return (
                            Container(
                              padding: const EdgeInsets.only(bottom: 11.0),
                              child: Row(
                                children: [
                                  Column( 
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                              return bookloading(
                                                  c: AuthorBook["items"][index + 1]["volumeInfo"]
                                                      ["industryIdentifiers"][0]["identifier"]);
                                            }));
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(9, 12, 0, 0),
                                                height: 230,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  image: DecorationImage(
                                                      image: NetworkImage(AuthorBook["items"]
                                                              [index + 1]["volumeInfo"]
                                                          ["imageLinks"]["thumbnail"]),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column( 
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                              return bookloading(
                                                  c: AuthorBook["items"][index + 1]["volumeInfo"]
                                                      ["industryIdentifiers"][0]["identifier"]);
                                            }));
                                          },
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                                                height: 230,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  image: DecorationImage(
                                                      image: NetworkImage(AuthorBook["items"]
                                                              [index + 1]["volumeInfo"]
                                                          ["imageLinks"]["thumbnail"]),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                          )
                        );
                      }
                    ),
                  ),
              ),            
            ],
          ),
        ]
      )
    );
  }
}