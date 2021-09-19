import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Favorites extends StatefulWidget {
  final String nameList;
  final String surnameList;
  final String numberList;
  
  const Favorites({ Key? key, required this.nameList, required this.surnameList, required this.numberList }) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
      ),
      
      body: Center(        
        child: Column(                                  
          children: [  
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: (){},
                 icon: Icon(Icons.star_outlined))

            ],
                                       
            ),
                               
            Padding(padding: EdgeInsets.symmetric(vertical: 70),),          
            Text(
              widget.nameList,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              widget.surnameList,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              widget.numberList,
              style: TextStyle(fontSize: 20),
            ),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.call)
                ),
              IconButton(
                onPressed: (){},
                 icon: Icon(Icons.message_rounded)
              ),
                IconButton(
                onPressed: (){},
                 icon: Icon(Icons.video_camera_back)
              ),
              
            
              
              
            ],

          )
          ],
          
          
        ),
      ),
    );
  }
}