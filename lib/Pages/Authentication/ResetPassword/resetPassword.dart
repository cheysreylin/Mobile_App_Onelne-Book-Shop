import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          label: Text('Email')
                        ),
                      ),
                    ),
                  ), 
                  SizedBox(height: 20,),
                  TextButton(
                    onPressed: (() {
                      FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _emailController.text)
                        .then((value) => Navigator.of(context).pop());
                    }), 
                    child: Container(
                        color: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 150),
                        child: const Text(
                          'Send Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
    );
  }
}