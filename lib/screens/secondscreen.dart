
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({Key? key}) : super(key: key);

  @override
  _SecondscreenState createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  List<String>? listItems;
  void setPhoneList(){
    
    Random random=new Random();
    String aa = "";
    listItems = List<String>.generate(100, (index) => "05"
                                                      + getRandNuber(random, 2)
                                                      + getRandNuber(random, 3)
                                                      + getRandNuber(random, 2)
                                                      + getRandNuber(random, 2)
                                                      );
  }
  String getRandNuber(Random rn, num width){
    String result = rn.nextInt(pow(10, width).toInt()).toString();
    return result.length < width ? result.padLeft(1,"0") : result;
   
  }

   
  void showMessage() {}

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';
    setPhoneList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade400,
          centerTitle: true,
          title: Text("Recents"),
        ),
        body: ListView.builder(
            itemCount: listItems!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Name Surname"),
                subtitle: Text(listItems![index]),
                trailing: IconButton(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: Icon(Icons.phone),
                  onPressed: () {
                    showDialog(
                      context: context, 
                      builder:(context){
                        return AlertDialog(                         
                          title: Text(listItems![index]),

                          

                        
                          ); 
                      
                      }
                      );
                  },
                ),
                leading: IconButton(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
              );
            }),
      ),
    );
  }
}
