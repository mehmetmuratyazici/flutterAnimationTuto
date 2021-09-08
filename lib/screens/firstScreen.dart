
import 'package:animation_tuto/screens/icons.dart';

import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.red.shade400, Colors.red.shade900],
              ),
            ),
          ),
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  left: !pressed
                      ? -MediaQuery.of(context).size.width * 0.5 - 50
                      : MediaQuery.of(context).size.width * 0.5 * 0.5,
                  curve: Curves.bounceOut,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        pressed = !pressed;
                                      });
                                    },
                                    icon: Icon(Icons.arrow_back_ios))
                              ],
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(hintText: "Kullanıcı Adı"),
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: SizedBox(
                                width: 120,
                                height: 50,
                                child: RaisedButton(
                                    color: Colors.red,
                                    child: Text("Login"),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              Iconsscreen()));
                                      return;
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("Uyarı"),
                                              content: Center(
                                                child:
                                                    Text("To be Countinue ..."),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Ok"))
                                              ],
                                            );
                                          });
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  left: pressed ? -300 : 0,
                  //top:  pressed ? MediaQuery.of(context).size.width * 0.5 -25 : 0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  child: Container(
                    child: SizedBox(
                      width: 100,
                      height: 50,
                      child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.red,
                        child: Text("Let's Go!"),
                        onPressed: () {
                          setState(() {
                            pressed = !pressed;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
