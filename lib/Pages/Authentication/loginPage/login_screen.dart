import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; 


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
    // initialize firebase app 
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            return const LoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
      },),
    );
  }
}


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // create login function 
  static Future<User?> loginUsingEmailPassword({
    required String email, required String password, required BuildContext context}) async{
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try{
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
        user = userCredential.user;
      } on FirebaseAuthException catch(e){
        if (e.code == "user-not-found"){
          print("No user found for that email");
        }
      }
      return user;
    }


  @override
  Widget build(BuildContext context) {

    // create the textfield controller 
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        height: 900,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 141, 174, 211), Color.fromARGB(255, 28, 82, 82)],
            )
          ),
        child: SingleChildScrollView(
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
              const SizedBox(height: 10,),
              // log in text container 
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Log In Now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 238, 238, 238),
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                      SizedBox(height: 10,),
                      Text(
                        'Please log in to continue using our app', 
                        style: TextStyle(
                          color: Color.fromARGB(255, 240, 240, 240)
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          label: Text('Email')
                        ),
                      ),
                    ), 
                    SizedBox(height: 20,),
                    Container(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          label: Text('Password')
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(238, 0, 0, 0),
                      child: TextButton(
                        //style: ButtonStyle(backgroundColor:MaterialStatePropertyAll(Color.fromARGB(255, 175, 175, 175))),
                        child: Text('Forgot Password?', style: TextStyle( fontSize: 11, color: Color.fromARGB(255, 41, 85, 230)),) ,
                        onPressed: (() {
                          // FirebaseAuth.instance
                          //     .sendPasswordResetEmail(email: _emailController.text)
                          //     .then((value) => Navigator.of(context).pop());
                          // })
                          Navigator.pushNamed(context, "/ResetPasswordScreen");
                        }
                      )
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
                      onPressed: () async{
                        User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                        print(user);
                        if(user != null){
                          Navigator.pushNamed(context, "/Home_screen");
                        }
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
                              Navigator.pushNamed(context, "/Register_screen");
                            }, 
                            child: 
                              Text('Sign Up', style: TextStyle(color: Color.fromARGB(255, 23, 151, 255), fontWeight: FontWeight.bold),)
                            )
                        ],
                      ),
                    ),
                    // Container(
                    //   child: Column(
                    //     children: [
                    //       Text('Or connect with'),
                    //       Container(
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blue,)),
                    //             IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blue,)),
                    //             // Image.network('http://pngimg.com/uploads/google/google_PNG19635.png',
                    //             //   width: 30, height: 30),
                    //             IconButton(onPressed: (){}, icon: Icon(Icons.home,color: Colors.grey), iconSize: 27),
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
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