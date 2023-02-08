import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttesting/source/Provider/bookloading.dart';

class horrorPopular extends StatefulWidget {
  var HorrorPopular;
  var d;
  horrorPopular({@required this.HorrorPopular});
  @override
  State<horrorPopular> createState() => _horrorPopularState();
}

class _horrorPopularState extends State<horrorPopular> {
  var rating = "Not available";
  var pubdate = "Not available";
  late bool _isloading;

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
    getpubdate();

    _isloading = true;
    Future.delayed(const Duration(seconds: 8), (){
      setState(() {
        _isloading = false;
      });
    });
    super.initState();
  }
 
  // get publish date 
  void getpubdate() {
    try {
      setState(() {
        pubdate =
            widget.d["items"][0]["volumeInfo"]["publishedDate"].toString();
      });
    } catch (e) {
      setState(() {
        pubdate = "Not available";
      });
    }
  }
  // get rating 
  void getrating() {
    try {
      setState(() {
        rating = widget.d["items"][0]["volumeInfo"]["averageRating"].toString();
      });
    } catch (e) {
      setState(() {
        rating = "Not available";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: const EdgeInsets.fromLTRB(4.0, 0, 0,0),
      height: 415,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 9,
          itemBuilder: (context, index) {
            return (Container(
              padding: const EdgeInsets.only(bottom: 11.0),
              child: Column( 
                children: [
                  _isloading
                  ? const Center(
                    child: CircularProgressIndicator(color: Colors.black,),
                  ):

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return bookloading(
                              c: widget.HorrorPopular["items"][index + 1]["volumeInfo"]
                                  ["industryIdentifiers"][0]["identifier"]);
                        }));
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 130,
                            width: 95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(widget.HorrorPopular["items"]
                                          [index + 1]["volumeInfo"]
                                      ["imageLinks"]["thumbnail"]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (widget.HorrorPopular["items"][index + 1]["volumeInfo"]
                                                  ["title"])
                                              .length >
                                          20
                                      ? st(widget.HorrorPopular["items"][index + 1]["volumeInfo"]
                                          ["title"])
                                      : widget.HorrorPopular["items"][index + 1]["volumeInfo"]
                                          ["title"],
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "by " +
                                      widget.HorrorPopular["items"][0]["volumeInfo"]["authors"][0],
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 15, color: Color.fromARGB(255, 119, 119, 119))),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  pubdate,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 117, 117, 117))),
                                ),
                                ElevatedButton(
                                  onPressed: (){}, 
                                  child: Text("Detail")
                                )
                              ],
                            ),
                          )
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
