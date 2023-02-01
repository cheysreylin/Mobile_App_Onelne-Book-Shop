

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projecttesting/model/api.dart';

class AddToFavourite extends StatefulWidget {
  const AddToFavourite({super.key});

  @override
  State<AddToFavourite> createState() => _AddToFavouriteState();
}

class _AddToFavouriteState extends State<AddToFavourite> {
  final bookset = Set<Books>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child:SizedBox(
        width: 90,
        height: 50.0, 
        child: ElevatedButton(
          onPressed: (){
            // setState(() {
            //   if(favourite){
            //     bookset.remove(book_list[index]);
            //     favourite = false;
            //   }
            //   else{
            //     bookset.add(book_list[index]);
            //     favourite = true;
            //   }
            // });
          }, 
          child: Icon(Icons.favorite_border_outlined)
        ),
      )
    );
  }
}

