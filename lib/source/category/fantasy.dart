// import 'package:boekiez/screens.dart/bookloading.dart';
// import 'package:boekiez/screens.dart/error.dart';
import 'package:flutter/material.dart';
import 'package:projecttesting/source/Provider/bookloading.dart';
import 'package:projecttesting/source/Provider/error.dart';

class fantasy extends StatefulWidget {
  var c2;
  fantasy({@required this.c2});

  @override
  State<fantasy> createState() => _fantasyState();
}

class _fantasyState extends State<fantasy> {
  String st(String s) {
    int count = 0;
    String ans = "";
    for (int i = 0; i < s.length; i++) {
      if (count == 3) {
        break;
      }
      if (s[i] == ' ') {
        count++;
      }
      ans = ans + s[i];
    }
    return ans + "...";
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 270,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (context, index) {
            return (Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          try {
                            return bookloading(
                                c: widget.c2["items"][index + 1]["volumeInfo"]
                                    ["industryIdentifiers"][0]["identifier"]);
                          } catch (e) {
                            return error();
                          }
                        }));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 230,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(widget.c2["items"]
                                          [index + 1]["volumeInfo"]
                                      ["imageLinks"]["thumbnail"]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (widget.c2["items"][index + 1]["volumeInfo"]
                                                ["title"])
                                            .length >
                                        20
                                    ? st(widget.c2["items"][index + 1]["volumeInfo"]
                                        ["title"])
                                    : widget.c2["items"][index + 1]["volumeInfo"]
                                        ["title"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[900]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
          }),
    ));
  }
}
