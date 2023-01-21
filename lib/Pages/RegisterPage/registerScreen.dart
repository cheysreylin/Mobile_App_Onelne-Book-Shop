import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; 


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              return RegisterScreen();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
        }),
    );
  }
}


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
    TextEditingController _passwordTextController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _userNameTextController = TextEditingController();

    static Future<User?> createUserWithEmailAndPassword({
    required String Username, required email, required password , required BuildContext contect}) async{
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email, 
                password: password);
        User? user = userCredential.user;
        return user;
      } on FirebaseAuthException catch(e){
        if (e.code == null){
          print("can't register");
        }
      }
      }



  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                        'Register Now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 49, 49, 49),
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                      SizedBox(height: 10,),
                      Text(
                        'Please enter detail to register using our app', 
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
                        controller: _userNameTextController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.verified_user),
                          label: Text('Username')
                        ),
                      ),
                    ), 
                    SizedBox(height: 20,),
                    Container(
                      child: TextField(
                        controller: _emailTextController,
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
                        controller: _passwordTextController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          label: Text('Password')
                        ),
                      ),
                    ),

                  ]
                ),
              ),
        
              // Log in container
              Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () async{
                        User? user = await createUserWithEmailAndPassword(
                          Username: _userNameTextController.text, 
                          email: _emailTextController.text, 
                          password: _passwordTextController.text, 
                          contect: context);
                          if (user != null){
                            Navigator.pushNamed(context, "/HomeScreen");
                          }
                      }, 
                      child: Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 150),
                        child: const Text(
                          'Register',
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
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, "/login_screen");
                            }, 
                            child: 
                              Text('Log In', style: TextStyle(color: Colors.blue),)
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

