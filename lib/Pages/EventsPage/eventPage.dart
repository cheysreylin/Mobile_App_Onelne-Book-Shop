
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 1600,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 12, 0,0),
                    child: Text("Up Coming Events", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 82, 82, 82)
                      ),
                    ),
                  )
                ],
              ),
              Divider(thickness: 1,),
              Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text("JK. Rowling singing event on book Harry Potter series with Fantastic beast poster signing"),
                          //Text("4/25/2021"),
                          Image.asset("assets/events_bookImg/harry-potter.jpg", height: 240, width: 360,),
                          Text("Location : Phnom Penh City of Cambodia, Aeon mall 2, second floor"),
                          Text("JK. Rowling singing event on book Harry Potter series with Fantastic beast poster signing..."),
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 6,),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text("JK. Rowling singing event on book Harry Potter series with Fantastic beast poster signing"),
                          //Text("4/25/2021"),
                          Image.asset("assets/events_bookImg/jumanji-the-next-level-.jpg", height: 240, width: 360,),
                          Text("Location : Phnom Penh City of Cambodia, Aeon mall 2, second floor"),
                          Text("JK. Rowling singing event on book Harry Potter series with Fantastic beast poster signing..."),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text("JK. Rowling singing event on book Harry Potter series with Fantastic beast poster signing"),
                          //Text("4/25/2021"),
                          Image.asset("assets/events_bookImg/spiderman3.jpg", height: 240, width: 360,),
                          Text("Location : Phnom Penh City of Cambodia, Aeon mall 2, second floor"),
                          Text("JK. Rowling singing event on book Harry Potter series with Fantastic beast poster signing..."),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text("JK. Rowling singing event on book Harry Potter series with Fantastic beast poster signing"),
                          //Text("4/25/2021"),
                          Image.asset("assets/events_bookImg/Luca.jpg", height: 240, width: 360,),
                          Text("Location : Phnom Penh City of Cambodia, Aeon mall 2, second floor"),
                          Text("JK. Rowling singing event on book Harry Potter series with Fantastic beast poster signing..."),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}