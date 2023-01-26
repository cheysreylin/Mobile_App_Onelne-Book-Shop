import 'package:flutter/material.dart';
import 'package:projecttesting/model/api.dart';


class BookDetail extends StatelessWidget {
  //const BookDetail({super.key});
  final Books book;
  const BookDetail(this.book,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 29, 29, 29)), 
          onPressed: (() {
          }),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert, color: Color.fromARGB(255, 29, 29, 29))),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Detail",
                    style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 48, 48, 48),
                    fontWeight: FontWeight.bold
                  ), 
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 200,
                        child: Image.asset(book.image)
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(book.book_title,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(book.author_name,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                      SizedBox(
                        width: 110,
                        child: Image.asset("assets/star/star.png")
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text("120 reviews",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 94, 94, 94)
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(book.price,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 40, 27, 228)
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Plot", 
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue
                      ), 
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Text(
                        book.description, 
                        softWrap: true,
                        maxLines: 14,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 14.5

                        ),
                      ),
                      
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Genres",
                        style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue
                      ), 
                      ),
                      SizedBox(
                      height: 5,
                    ),
                      Text("Thriller")
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Column(
                    children: [
                      Text("Published Date",
                        style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue
                      ), 
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("12/11/2025")
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 250,
                    height: 50.0, 
                    child: ElevatedButton(
                      onPressed: (){}, 
                      child: Text("Add to Cart"),
                    ),
                  ),
                  
                  SizedBox(
                    width: 90,
                    height: 50.0, 
                    child: ElevatedButton(
                      onPressed: (){}, 
                      child: Icon(Icons.favorite_border_outlined)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      );
  }
}



