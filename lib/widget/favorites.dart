import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({ Key? key }) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(

        child: Column(children: [
          IconButton(
            onPressed: (){},
            iconSize: 80,
             icon:Icon(Icons.person),
             padding: EdgeInsets.all(30),
             
           
             
             )

        ],),
      ) ,
      
    );
  }
}