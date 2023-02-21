import 'package:flutter/material.dart';

class PrivacySecurity extends StatelessWidget {
  const PrivacySecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text("Privacy &", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 54, 54, 54)),)),
              Container(
                alignment: Alignment.topLeft,
                child: Text("Your Security", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 54, 54, 54)),)),
              SizedBox(
                height: 15,
              ),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    width: 20,
                    height: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTftFAP_Fg96hDjZAzuGKEMCq9Qz02y-Z25iAzqT4wpelC5FCRvkrCf6PU57QfpFsBKQeY&usqp=CAU",

                      ),
                    ),
                  ),
                ),
                title: Text(
                  'Your data will not be sole.',
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    width: 20,
                    height: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTftFAP_Fg96hDjZAzuGKEMCq9Qz02y-Z25iAzqT4wpelC5FCRvkrCf6PU57QfpFsBKQeY&usqp=CAU",

                      ),
                    ),
                  ),
                ),
                title: Text(
                  'You control which types of data you share, and you can stop sharing your data anytime',
                ),
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    width: 20,
                    height: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTftFAP_Fg96hDjZAzuGKEMCq9Qz02y-Z25iAzqT4wpelC5FCRvkrCf6PU57QfpFsBKQeY&usqp=CAU",

                      ),
                    ),
                  ),
                ),
                title: Text(
                  'Studies must tell you how your data support their research.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}