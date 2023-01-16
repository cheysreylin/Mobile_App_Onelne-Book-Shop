import 'dart:ui';

import 'package:flutter/material.dart'; 

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // backgroundColor: Color.fromARGB(255, 205, 228, 241),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // logo container 
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset("assets/homescreen/book_icon.png")
                  ),
                ),
              ),
              SizedBox(height: 10,),
              // log in text container 
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Log In Now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 49, 49, 49),
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                      SizedBox(height: 10,),
                      Text(
                        'Please log in to continue using our app', 
                        style: TextStyle(
                          color: Color.fromARGB(255, 128, 128, 128)
                        ),
                        )
                    ],
                  ),
                ),
              ),
        
              // Text input container 
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Column(
                  children: [
                    Container(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Email')
                        ),
                      ),
                    ), 
                    SizedBox(height: 20,),
                    Container(
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Password')
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(210, 10, 0, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 255, 255, 255))),
                        child: Text('Forgot Password?', style: TextStyle( fontSize: 10, color: Color.fromARGB(255, 128, 128, 128)),) ,
                        onPressed: (() {
                        
                        })
                      )
                    )
                  ]
                ),
              ),
        
              // Log in container
              Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, "/HomeScreen");
                      }, 
                      child: Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 150),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                      )
                    ), 
                    Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: (){
        
                            }, 
                            child: 
                              Text('Sign Up', style: TextStyle(color: Colors.blue),)
                            )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text('Or connect with'),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blue,)),
                                IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blue,)),
                                // Image.network('http://pngimg.com/uploads/google/google_PNG19635.png',
                                //   width: 30, height: 30),
                                IconButton(onPressed: (){}, icon: Icon(Icons.home,color: Colors.grey), iconSize: 27),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
        
            ],
            ),
        ),
      ),
    );
  }
}