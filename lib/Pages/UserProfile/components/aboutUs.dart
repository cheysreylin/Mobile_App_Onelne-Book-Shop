import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final List<Testimonial> testimonials = [
      Testimonial('Sreylin Chey', 'Backend Developer'),
      Testimonial('Yun Somphors', 'Frontend Developer'),
      Testimonial('Poh VichetRotha', 'UX/UI Designer/Helper'),
    ];

    return Scaffold(
        appBar: AppBar(
          
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [

              //Name and Logo
              Container(
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Image.asset(
                      'assets/aboutus/about-us.jpg',
                      fit: BoxFit.cover,
                      width: 500,
                      height: 120,
                    ),
                  ],
                ),
              ),

              //brief summary
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Our company offers a wide range of high-quality products and services to meet the needs of our customers.',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
              ),

              //statement and values
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mission Statement:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Our mission is to provide high-quality products and services to our customers.',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Values:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Customer satisfaction is our top priority'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('We strive for continuous improvement'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('We value honesty and integrity in all our actions'),
                      ),
                    ],
                  )
              ),

              //products or service
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Products:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('High-quality and durable'),
                      ),
                      ListTile(
                        leading: Icon(Icons.check),
                        title: Text('Easy to use and customize'),
                      ),
                    ],
                  )
              ),

              //Testimonials or reviews
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(8),
                child: Text(
                  'Team Members',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                width: screenWidth,
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: testimonials.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              testimonials[index].author,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(height: 4),
                            Text(
                              testimonials[index].text,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              //contact information
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text('Kirirom Institute of Technology'),
                        subtitle: Text('Kampong Spue, Cambodia.'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('(+855) 122-912-05'),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text('cheysreylin20@kit.edu.kh'),
                      ),
                    ],
                  )
              ),

              //social media
              Container(
                  width: screenWidth,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Follow Us:',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Facebook'),
                        onTap: () => launchUrl(Uri.parse('https://www.facebook.com/sreylin.chey.1')),
                      ),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Twitter'),
                        onTap: () => launchUrl(Uri.parse('https://twitter.com/')),
                      ),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text('Instagram'),
                        onTap: () => launchUrl(Uri.parse('https://www.instagram.com/pinyin_19/')),
                      ),
                    ],
                  )
              ),


            ],
          ),
        )

    );
  }
}

class Testimonial {
  final String author;
  final String text;

  Testimonial(this.author, this.text);
}