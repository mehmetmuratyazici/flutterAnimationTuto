import 'package:animation_tuto/screens/secondscreen.dart';
import 'package:flutter/material.dart';

class Iconsscreen extends StatefulWidget {
  const Iconsscreen({Key? key}) : super(key: key);

  @override
  _IconsscreenState createState() => _IconsscreenState();
}

void changeScreen(BuildContext _context, Widget _widget) {
  print(_context);
  Navigator.push(_context, MaterialPageRoute(builder: (_context) => _widget));
}

dynamic createButton(
    Function fn, Icon _icon, double _size, BuildContext? _context) {
  return new IconButton(
    onPressed: fn(_context),
    icon: _icon,
    iconSize: _size,
  );
}

class _IconsscreenState extends State<Iconsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade400, Colors.red.shade900],
          ),
        ),
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 100,
              icon: Icon(
                Icons.contact_phone_outlined,
              ),
              color: Colors.white,
              onPressed: () {
                changeScreen(context, Secondscreen());
              },
            ),
            IconButton(
              iconSize: 100,
              icon: Icon(
                Icons.settings_outlined,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
            IconButton(
              iconSize: 100,
              icon: Icon(
                Icons.notifications_on_outlined,
              ),
              color: Colors.white,
              onPressed: () {},
            ),
            /*
            createButton(
              (context) {
                print(1);
              },
              Icon(
                Icons.settings_outlined,
                color: Colors.white,
              ),
              100,
              context,
            ),*/
          ],
        ),
      ),
    ]));
  }
}
