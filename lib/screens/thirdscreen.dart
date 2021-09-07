import 'package:flutter/material.dart';

class Thirdscreen extends StatefulWidget {
  final String name;
  final String number;

  const Thirdscreen({Key? key, required this.name, required this.number})
      : super(key: key);

  @override
  _ThirdscreenState createState() => _ThirdscreenState();
}

class _ThirdscreenState extends State<Thirdscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              widget.number,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
