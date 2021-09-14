import 'dart:math';
import 'package:animation_tuto/screens/Icons.dart';
import 'package:animation_tuto/screens/thirdscreen.dart';
import 'package:animation_tuto/widget/keypadofcall.dart';
import 'package:animation_tuto/widget/people.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  int _selectedIndex = 0;

  void saveValueLocalStorage(key, val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, val);
  }

  void getValueLocalStorage(key) async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString(key));
  }

  @override
  Widget build(BuildContext context) {
    //saveValueLocalStorage("entry", "Merhaba çanım");
    //getValueLocalStorage("entry");
    setPhoneList();
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        print(index);
      });
    }

    List<Widget> _pages = <Widget>[
      
      Center(
        child: Icon(
          Icons.star_outlined,
          size: 150,
        ),
      ),      
      contacts(),   
      People(), 
     
      GetKeyPad(),
      Center(
        child: Icon(
          Icons.keyboard,
          size: 150,
        ),
      ),
      
      Center(
        child: Icon(
          Icons.voicemail_outlined,
          size: 150,
        ),
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
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
                },
              );
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
      },
    );
  }
}
