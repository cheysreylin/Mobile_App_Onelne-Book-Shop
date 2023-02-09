// ignore_for_file: prefer_const_constructors, sort_child_properties_last

// import 'package:boekiez/category/fantasy.dart';
// import 'package:boekiez/category/horror.dart';
// import 'package:boekiez/category/health.dart';
// import 'package:boekiez/category/adventure.dart';
// import 'package:boekiez/screens.dart/bookloading.dart';
// import 'package:boekiez/screens.dart/search_loadind.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttesting/source/category/adventure.dart';
import 'package:projecttesting/source/category/fantasy.dart';
import 'package:projecttesting/source/category/health.dart';
import 'package:projecttesting/source/category/horror.dart';

// ignore: must_be_immutable
class TopChart extends StatefulWidget {
  var c1;
  var c2;
  var c3;
  var c4;

  TopChart(
      {super.key,
      @required this.c1,
      @required this.c2,
      @required this.c3,
      @required this.c4});

  @override
  State<TopChart> createState() => _TopChartState();
}

class _TopChartState extends State<TopChart> {
  TextEditingController t = TextEditingController();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.c1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                          child: ListView(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Adventure",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      adventure(c4: widget.c1),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Fantasy",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      fantasy(c2: widget.c2),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Horror",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      horror(c3: widget.c3),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Health",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 51, 51, 51)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      romance(c4: widget.c4),
                    ],
                  )))
                ],
              ),
            ))
      ],
    ));
  }
}
