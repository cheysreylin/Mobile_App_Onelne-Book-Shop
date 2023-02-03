import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 141, 174, 211), Color.fromARGB(255, 28, 82, 82)],
              )
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 200, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Lost World',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold, 
                      color: Colors.white
                    ),
                    ), 
                  Text(
                    'Book Shop',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold, 
                      color: Color.fromARGB(255, 224, 224, 224)
                    ),
                  ),
                  const SizedBox(height: 70,),
                  Container(
                    margin: EdgeInsets.fromLTRB(130.0, 70.0, 10.0, 10.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 130,
                          child: FloatingActionButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/login_screen');
                            },
                            //backgroundColor: Color.fromARGB(255, 61, 119, 129),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color.fromARGB(255, 182, 182, 182),width: 2),
                              borderRadius: BorderRadius.circular(10), 
                            ),
                            child: Text('Next'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],   
              ),
            ),
          ),
        ), 
      ),
    );
  }
}