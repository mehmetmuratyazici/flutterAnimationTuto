import 'package:animation_tuto/screens/fourthscreen.dart';
import 'package:animation_tuto/screens/secondscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({ Key? key }) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}
void changeScreen(BuildContext _context, Widget _widget) {
  Navigator.push(_context, MaterialPageRoute(builder: (_context) => _widget));
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
      
        children: [
          IconButton(          
            onPressed: (){
              changeScreen(context, Fourthscreen());
            },
          
            iconSize: 30,                   
             icon:Icon(Icons.add)
            

             )
      ],
      ),
    );
  }
}