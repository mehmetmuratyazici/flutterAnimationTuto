import 'dart:js';

import 'package:animation_tuto/provider/people_provider.dart';
import 'package:animation_tuto/widget/people.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}
void changeScreen(BuildContext _context, Widget _widget) {
  Navigator.push(_context, MaterialPageRoute(builder: (_context) => _widget));
}


class _FavoritesScreenState extends State<FavoritesScreen> {
   
  @override
  Widget build(BuildContext context) {
    
    final fav = Provider.of<PeopleProvider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red.shade400,
          centerTitle: true,
          title: Text("Favorites"),          
          actions: [
            IconButton(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: Icon(Icons.add), 
                          
              onPressed: () {
                changeScreen(context,People());
              },
            ),
           
             IconButton(onPressed: (){
           
             },
             highlightColor: Colors.transparent,
             hoverColor: Colors.transparent,
             iconSize: 50,
             icon: Text("Düzenle",))
           
          ],
          
         
          ),
      body: ListView.builder(
       
        itemCount: fav.favNameList!.length,
        itemBuilder: (context, index) {
          return ListTile(            
            
            title: Text(
                fav.favNameList![index] + ' ' + fav.favSurnameList![index]),
            subtitle: Text(fav.favNumberList![index]),
            
            trailing: IconButton(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: Icon(Icons.phone),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(fav.favNumberList![index]),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
     
    );
  }
}
