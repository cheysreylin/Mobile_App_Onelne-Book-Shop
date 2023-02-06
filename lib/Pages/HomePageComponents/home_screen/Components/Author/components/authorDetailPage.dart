import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecttesting/Pages/HomePageComponents/home_screen/Components/Author/components/constants.dart';
import 'package:projecttesting/model/AllAuthor/AuthorDetail.dart';
class AuthorDetail extends StatelessWidget {

  final AllAuthor authordetails;

  AuthorDetail({required this.authordetails});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: [

          Container(
            child: Hero(
              tag: authordetails.name,
              child: Image.asset(
                authordetails.image,
                fit: BoxFit.fitWidth
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 48, left: 32,),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.5,
              padding: EdgeInsets.only(top: 64),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 32, left: 32, bottom: 16,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [ 
                          Text(
                            authordetails.name,
                            style: GoogleFonts.catamaran(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [

                                Row(
                                  children: <Widget>[

                                    Icon(Icons.star, size: 20, color: kStarsColor,),
                                    Icon(Icons.star, size: 20, color: kStarsColor,),
                                    Icon(Icons.star, size: 20, color: kStarsColor,),
                                    Icon(Icons.star, size: 20, color: kStarsColor,),
                                    Icon(Icons.star_half, size: 20, color: kStarsColor,),

                                  ],
                                ),

                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                authordetails.background,
                                style: GoogleFonts.catamaran(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 100,
                    padding: EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 32,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 328,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kPrimaryColor.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Read more about author...",
                                  style: GoogleFonts.catamaran(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 32, bottom: (size.height * 0.5) - (75 / 2)),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(authordetails.image), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}