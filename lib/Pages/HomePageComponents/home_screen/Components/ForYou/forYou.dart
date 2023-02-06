import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/components/bestAuthor.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/components/bookHeader.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/ForYou/components/horrorPopular.dart';
import '../../../../../../settings/settings_controller.dart';
import '../../../../../source/category/adventure.dart';

class ForYou extends StatefulWidget {
  ForYou({Key? key, required this.settingsController, this.color}) : super(key: key);
  final SettingsController settingsController;
  final Color? color;

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  late bool _isloading;
  int _currentPage = 0;
  var c2;
  var HorrorPopular;

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
    Response r3 = await get(Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=subject:horror&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA"));
    Response r2 = await get(Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=subject:fantasy&download=epub&orderBy=newest&key=AIzaSyAqxw3nnCxwNQXRmXb-ZFi8FTNyhz6kwGA"));
  
    setState(() {
      c2 = jsonDecode(r2.body);
      HorrorPopular = jsonDecode(r3.body);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        
        //physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 234, 239, 240)
          ),
          height: 3300,
          child: Column(
            children: [
              //CustomAppBar(settingsController: settingsController,),
              // Movie Header 
              BookHeader(settingsController: widget.settingsController,),
              // Recommendation book 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                    child: Text("Recommendation",
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // adventure(c4: c2),
              Column(
                children: [
                  _isloading
                  ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    )
                  ): adventure(c4: c2),
                ],
              ),

              
              // TO FETCH MOCK UP API ONLY 

              // Flexible(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     itemCount: book_list.length,
              //     itemBuilder: ((context, index) {
              //       Books model = book_list[index];
              //       return Container(
              //         padding: EdgeInsets.only(top: 10),
              //         child: ClipRRect(
              //           child: GestureDetector(
              //             onTap: (() {
              //               Navigator.of(context).push(MaterialPageRoute(builder: ((context) => BookDetail(model))));
              //             }),
              //               child: Column(
              //                 children: [
              //                   SizedBox(
              //                     height: _size.height> 100? 160 : 140,
              //                     width: _size.width > 350 ? 110 : 150,
              //                     child: Expanded(
              //                       child: ClipRRect(
              //                         borderRadius: BorderRadius.all(Radius.circular(10)),
              //                         child: Hero(
              //                           tag: book_list[index],
              //                           child: Image.asset(
              //                             model.image,
              //                             fit: BoxFit.fill,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     child: Container(
              //                       padding: EdgeInsets.all(10.0),
              //                       child: Column(
              //                         children: [
              //                           Row(
              //                               mainAxisAlignment: MainAxisAlignment.start,
              //                             children: [
              //                               Container(
              //                                 child:
              //                                   Text(
              //                                     model.book_title,
              //                                     style: new TextStyle(
              //                                         fontSize: 15.0,
              //                                         fontWeight: FontWeight.bold,
              //                                         color: Color.fromARGB(255, 66, 66, 66)
              //                                       ),
              //                                     ),
              //                                 ),
              //                             ],
              //                           ),
              //                           SizedBox(height: 2,),
              //                           Row(
              //                             mainAxisAlignment: MainAxisAlignment.start,
              //                             children: [
              //                               Container(
              //                                 child: 
              //                                   Text(model.author_name,
              //                                   style: new TextStyle(
              //                                         fontSize: 13,
              //                                         fontWeight: FontWeight.bold,
              //                                         color: Color.fromARGB(255, 66, 66, 66)
              //                                       )
              //                                   ),
              //                               ),
              //                             ],
              //                           ), 
              //                         ],
              //                       ),
              //                     ),
              //                   ),
                          
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              
              //     }
              //   )),
              // ),    
    
             // Popular 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // margin: const EdgeInsets.fromLTRB(0, 0, 0, 135),
                    padding: const EdgeInsets.fromLTRB(12, 22, 0, 20),
                    child: Text("Popular",
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
                horrorPopular(HorrorPopular: HorrorPopular)
              ],
             ),
              
              //  TO FETCH MOCK UP API ONLY 
              // SizedBox(
              //   height: 440,
              //   child: Flexible(
              //     child: ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.vertical,
              //       itemCount: book_list.length,
              //       itemBuilder: ((context, index) {
              //         Books model = book_list[index];
              //         return Card(
              //           elevation: 5,
              //           child: Container(
              //             margin: EdgeInsets.all(10),
              //             child: ClipRRect(
              //               child: Row(
              //                 children: [
              //                   Container(
              //                     height: 120,
              //                     padding: EdgeInsets.only(left: 20),
              //                     // margin: EdgeInsets.all(10),
              //                     child: ClipRRect(
              //                       borderRadius: BorderRadius.all(Radius.circular(5)),
              //                       child: Container(
              //                         child: Image.asset(model.image),
              //                       ),
              //                     ),
              //                   ),
              //                   Container(
              //                     width: 200,
              //                     height: 120,
              //                     // color: Colors.amber,
              //                     child: SingleChildScrollView(
              //                       scrollDirection: Axis.horizontal,
              //                       child: Column(
              //                         children: [
              //                           Container(
              //                             margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
              //                             child: Row(
              //                               mainAxisAlignment: MainAxisAlignment.start,
              //                               children: [
              //                                 Text(model.book_title,
              //                                 style: new TextStyle(
              //                                         fontSize: 16.0,
              //                                         fontWeight: FontWeight.bold,
              //                                         color: Color.fromARGB(255, 66, 66, 66)
              //                                       ),
              //                                 ),
                                              
              //                               ],
              //                             ),
              //                           ),
              //                           SizedBox(height: 6,),
              //                           Container(
              //                             margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
              //                             child: Row(
              //                                 mainAxisAlignment: MainAxisAlignment.start,
              //                               children: [
              //                                 Text(model.author_name,
              //                                 style: new TextStyle(
              //                                         fontSize: 13.5,
              //                                         fontWeight: FontWeight.bold,
              //                                         color: Color.fromARGB(255, 66, 66, 66)
              //                                       )
              //                                 ),
              //                               ],
              //                             ),
              //                           ), 
              //                           SizedBox(height: 6,),
              //                           Container(
              //                             margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
              //                             child: Row(
              //                               mainAxisAlignment: MainAxisAlignment.end,
              //                               children: [
              //                                 Text((model.price).toString()),
              //                               ],
              //                             ),
              //                           ),
              //                           SizedBox(height: 6,),
              //                           Container(
              //                             margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
              //                             child: Row(
              //                               mainAxisAlignment: MainAxisAlignment.start,
              //                               children: [
              //                                 ElevatedButton(
              //                                   onPressed: (){}, 
              //                                   child: Text("Details")
              //                                 )
              //                               ],
              //                             ),
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       }
              //     )),
              //   ),
              // ),       
            
              // Best Author 
              Container(
                child: BestAuthor(),
              )
            ],
          ),               
        ),
      ),
    );
  }
}