import 'package:flutter/material.dart';

class Voicemail extends StatefulWidget {
  const Voicemail({ Key? key }) : super(key: key);

  @override
  _VoicemailState createState() => _VoicemailState();
}

class _VoicemailState extends State<Voicemail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Colors.red.shade400,
          centerTitle: true,
          title: Text("Voicemail"),          
          actions: [],
       ),
       body: Center(
         
       ),
    );
                       
   
  }
}