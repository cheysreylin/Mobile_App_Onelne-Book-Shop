
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1600,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(155, 12, 0,0),
                    child: Text("New", 
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 61, 61, 61)
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
                          Image.asset("assets/events_bookImg/harry-potter.jpg", height: 240, width: 360,),
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