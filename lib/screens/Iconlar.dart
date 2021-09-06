import 'package:animation_tuto/screens/secondscreen.dart';
import 'package:flutter/material.dart';

class Iconsscreen extends StatefulWidget {
  const Iconsscreen({ Key? key }) : super(key: key);

  @override
  _IconsscreenState createState() => _IconsscreenState();
}

class _IconsscreenState extends State<Iconsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.red.shade400,
        centerTitle: true,
        title: Text("İcons"),

      ),
      body:  Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(              
                colors: [Colors.red.shade400, Colors.red.shade900],
              ),
            ),
        ),
        Row(
          children: [
            Container(
              child: Stack(
                children: [
                  IconButton(
                    iconSize: 100,
                   
                     icon: Icon(Icons.person,),
                     color:Colors.white,
                      onPressed:(){
                        Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: (context) =>
                        Secondscreen()));

                    },
                
              ),
      
                ]
              ),
              
              ),
          ],
        )
        ]
        
         )
         
    );
  }
}