
import 'dart:html';
import 'dart:math';

import 'package:animation_tuto/screens/thirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';





class Secondscreen extends StatefulWidget {
  const Secondscreen({Key? key}) : super(key: key);

  @override
  _SecondscreenState createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  List<String>? listItems;
  void setPhoneList() {
    Random random = new Random();
    listItems = List<String>.generate(
        100,
        (index) =>
            "05" +
            getRandNumber(random, 2) +
            getRandNumber(random, 3) +
            getRandNumber(random, 2) +
            getRandNumber(random, 2));
  }

  String getRandNumber(Random rn, num width) {
    
    String result = rn.nextInt(pow(10, width).toInt()).toString();
    return result.length < width ? result.padLeft(1, "0") : result;
  }

  void showMessage() {}
  
  final number = TextEditingController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    setPhoneList();
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        print(index);
      });
    }

    List<Widget> _pages = <Widget>[
      Icon(
        Icons.star_outlined,
        size: 150,
      ),
      contacts(),
      Icon(
        Icons.people,
        size: 150,
      ),
     call(),
      Icon(
        Icons.keyboard,
        size: 150,
        
      
      ),
      Icon(
        Icons.voicemail_outlined,
        size: 150,
      ),
    ];
    

    final navbar = BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_outlined,
              color: Colors.red,
              
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time_outlined,
              color: Colors.red,
            ),
            label: 'Recents',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.red,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.apps,
              color: Colors.red,
            ),
            label: 'Keypad',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.voicemail_outlined,
              color: Colors.red,
            ),
            label: 'Voicemail',
          ),
        ]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
        title: Text("Recents"),
      ),
      bottomNavigationBar: navbar,
      body: Center(
        child: _pages[_selectedIndex],
      ),
    );
  }


  
  dynamic call(){
   
    return Scaffold(
      body: Center(        
        child:
        Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
        
          children: [   
            
            
             TextField(
               controller: number,
            
            decoration: new InputDecoration(labelText: "",),
            
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
           ], 
          ),
            Padding(
              padding: EdgeInsets.all(0),
               
             
                child: Row(
                  
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,                  
                   children: [  
                                              
                    FloatingActionButton(                     
                      backgroundColor: Colors.grey,                                            
                      child: Text("1"),
                      onPressed: (){
                       
  }, 
                     
               
                                         
                      
                    ),
                    
                    FloatingActionButton(                     
                      backgroundColor: Colors.grey,                     
                      onPressed: (){},
                      child: Text("2"),
                      ),
                      FloatingActionButton(
                      backgroundColor: Colors.grey,                     
                      onPressed: (){},
                      child: Text("3"),
                      )  
                  ],                  
                ), 
        ),
                     Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: [
                    FloatingActionButton(
                      backgroundColor: Colors.grey,
                      onPressed: (){},
                      child: Text("4"),
                    ),
                    FloatingActionButton(                      
                      backgroundColor: Colors.grey,                     
                      onPressed: (){},
                      child: Text("5"),
                      ),
                      FloatingActionButton(
                      backgroundColor: Colors.grey,                     
                      onPressed: (){},
                      child: Text("6"),
                      )  
                  ],               
                  ),
                  Row( 
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                    children: [
                    FloatingActionButton(
                      backgroundColor: Colors.grey,
                      onPressed: (){},
                      child: Text("7"),
                    ),
                    FloatingActionButton(                      
                      backgroundColor: Colors.grey,                     
                      onPressed: (){},
                      child: Text("8"),
                      ),
                      FloatingActionButton(
                      backgroundColor: Colors.grey,                     
                      onPressed: (){},
                      child: Text("9"),
                      )  
                  ],
                    ),
                    Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                      children: [
                      FloatingActionButton(
                      backgroundColor: Colors.grey,
                      onPressed: (){},
                      child: Text("*"),
                    ),
                    FloatingActionButton(                      
                      backgroundColor: Colors.grey,                     
                      onPressed: (){},
                      child: Text("0"),
                      ),
                      FloatingActionButton(
                      backgroundColor: Colors.grey,                     
                      onPressed: (){},
                      child: Text("#"),
                      )  
                  ],
                    )      
                   
          ],
        ),
          
        ),
        floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.phone),        
          backgroundColor: Colors.red.shade400,           
          onPressed: (){}
          
          ),
        
          
      );
    
  }
  

  dynamic contacts() {
    return ListView.builder(
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
                    builder: (context) {
                      return AlertDialog(
                        title: Text(listItems![index]),
                      );
                    });
              },
            ),
            leading: IconButton(
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Thirdscreen(
                      name: 'Name Surname',
                      number: listItems![index],
                    ),
                  ),
                );
              },
            ),
          );
         
        });
        
  }

  
}



