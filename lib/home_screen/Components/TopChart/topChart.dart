import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projecttesting/provider/api.dart';

class TopChart extends StatelessWidget {
  const TopChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 1800,
          child: Column(
            children: [
              // TOP SALE
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                    child: Text("Top Sell",
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
                            SizedBox(
                              width: 170,
                              // height: 190,
                              child: Container(
                                // color: Colors.amber,
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child:
                                            Text(
                                              model.book_title,
                                              style: new TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 66, 66, 66)
                                                ),
                                              ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 2,),
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
                                    Container(
                                      child:
                                        Text(
                                          model.description, 
                                          //"Swimming brings back a nightmare that Rebecca Fishburn would much rather forget. So when the gym teacher announces plans to take the class swimming for the next two weeks, Reb can think of nothing else…and she is terrified! ",
                                          softWrap: true,
                                          maxLines: 13,
                                          overflow: TextOverflow.ellipsis,
                                          style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color.fromARGB(255, 66, 66, 66)
                                                )
                                        ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child:
                                            Text((model.price).toString()),
                                        ),
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

              // TOP SEARCH 
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                    child: Text("Top Search",
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
                            SizedBox(
                              width: 170,
                              // height: 190,
                              child: Container(
                                // color: Colors.amber,
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child:
                                            Text(
                                              model.book_title,
                                              style: new TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 66, 66, 66)
                                                ),
                                              ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 2,),
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
                                    Container(
                                      child:
                                        Text(
                                          model.description, 
                                          //"Swimming brings back a nightmare that Rebecca Fishburn would much rather forget. So when the gym teacher announces plans to take the class swimming for the next two weeks, Reb can think of nothing else…and she is terrified! ",
                                          softWrap: true,
                                          maxLines: 13,
                                          overflow: TextOverflow.ellipsis,
                                          style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color.fromARGB(255, 66, 66, 66)
                                                )
                                        ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child:
                                            Text((model.price).toString()),
                                        ),
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

              // TOP READ
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                    child: Text("Top read",
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
                            SizedBox(
                              width: 170,
                              // height: 190,
                              child: Container(
                                // color: Colors.amber,
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child:
                                            Text(
                                              model.book_title,
                                              style: new TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 66, 66, 66)
                                                ),
                                              ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 2,),
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
                                    Container(
                                      child:
                                        Text(
                                          model.description, 
                                          //"Swimming brings back a nightmare that Rebecca Fishburn would much rather forget. So when the gym teacher announces plans to take the class swimming for the next two weeks, Reb can think of nothing else…and she is terrified! ",
                                          softWrap: true,
                                          maxLines: 13,
                                          overflow: TextOverflow.ellipsis,
                                          style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color.fromARGB(255, 66, 66, 66)
                                                )
                                        ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child:
                                            Text((model.price).toString()),
                                        ),
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

              // TOP SAVE
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 0, 0),
                    child: Text("Top Save",
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
                            SizedBox(
                              width: 170,
                              // height: 190,
                              child: Container(
                                // color: Colors.amber,
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child:
                                            Text(
                                              model.book_title,
                                              style: new TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 66, 66, 66)
                                                ),
                                              ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 2,),
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
                                    Container(
                                      child:
                                        Text(
                                          model.description, 
                                          //"Swimming brings back a nightmare that Rebecca Fishburn would much rather forget. So when the gym teacher announces plans to take the class swimming for the next two weeks, Reb can think of nothing else…and she is terrified! ",
                                          softWrap: true,
                                          maxLines: 13,
                                          overflow: TextOverflow.ellipsis,
                                          style: new TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color.fromARGB(255, 66, 66, 66)
                                                )
                                        ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child:
                                            Text((model.price).toString()),
                                        ),
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
    );
  }
}