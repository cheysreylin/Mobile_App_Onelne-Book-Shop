import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; 
import 'package:email_validator/email_validator.dart';
import 'package:projecttesting/Pages/Authentication/DatabaseManager/dataBaseManager.dart';

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

    // check validation
    final _key = GlobalKey<FormState>();
    

    static Future<User?> createUserWithEmailAndPassword({
    required String name, required String email, required String password , required BuildContext contect}) async{
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email, 
                password: password);
        User? user = userCredential.user;
        await DatabaseManager().createUserData(name, email, user!.uid);
        return user;
      } on FirebaseAuthException catch(e){
        if (e.code == null){
          print("can't register");
        }
      }
      }


  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 156, 170, 175),
      body: Container(
        height: 820,
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
              SizedBox(height: 7,),
              // log in text container 
              Container(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Register Now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 223, 223, 223),
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                        ),
                        ),
                      SizedBox(height: 10,),
                      Text(
                        'Please enter detail to register using our app', 
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)
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
                      child: TextFormField(
                        controller: _userNameTextController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_add_alt_1_rounded),
                          label: Text('Username', style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)
                          ),)
                        ),
                        onChanged: (u){
                          validateUserName(u);
                        },
                      ),
                    ), 
                    SizedBox(height: 20,),
                    Container(
                      child: TextFormField(
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          label: Text('Email', style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255))
                          ),
                        ),
                        onChanged: (val){
                          validateEmail(val);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(_errorMessage, style: TextStyle(color: Colors.red), ),
                    ), 
                    // SizedBox(height: 20,),
                    Container(
                      child: TextField(
                        controller: _passwordTextController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          label: Text('Password', style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)))
                        ),
                        onChanged: (pw){
                          validatePassword(pw);
                        },
                      ),
                    ),

                  ]
                ),
              ),
        
              // Log in container
              Column(
                children: [
                  TextButton(
                    onPressed: () async{
                      User? user = await createUserWithEmailAndPassword(
                        name: _userNameTextController.text, 
                        email: _emailTextController.text, 
                        password: _passwordTextController.text, 
                        contect: context);
                        if (user != null){
                          Navigator.pushNamed(context, "/HomeScreen");
                        }
                        else{
                          print(user.toString());
                          _userNameTextController.clear();
                          _passwordTextController.clear();
                          _emailTextController.clear();
                          Navigator.pop(context);
                        }
                    }, 
                    child: Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 150),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15
                        ),
                      ),
                    )
                  ), 
                  Container(
                    margin: EdgeInsets.only(left: 80),
                    child: Row(
                      children: [
                        Text("Already have an account?", style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255))),
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, "/login_screen");
                          }, 
                          child: 
                            Text('Log In', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
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
            ],
            ),
        ),
      ),
    );
  }

  // To validate  the email 
  void validateEmail(String val) {
    if(val.isEmpty){
  setState(() {
    _errorMessage = "Email can not be empty";
  });
    }else if(!EmailValidator.validate(val, true)){
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    }else{
      setState(() {
        _errorMessage = "";
      });
    }
  }

  // To validate username
  void validateUserName(String u) {
    if(u.isEmpty){
  setState(() {
    _errorMessage = "Username can't be empty...";
  });
    }else if(!EmailValidator.validate(u, true)){
      setState(() {
        return null;
      });
    }else{
      setState(() {
        _errorMessage = "";
      });
    }
  }

  // To validate password 
  void validatePassword(String pw) {
    if(pw.isEmpty){
  setState(() {
    _errorMessage = "Password can have at least 6 char...";
  });
    }else if(!EmailValidator.validate(pw, true)){
      setState(() {
        return null;
      });
    }else{
      setState(() {
        _errorMessage = "";
      });
    }
  }
}

