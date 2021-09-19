import 'package:animation_tuto/provider/people_provider.dart';
import 'package:animation_tuto/widget/people.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Fourthscreen extends StatefulWidget {
  const Fourthscreen({Key? key}) : super(key: key);

  @override
  _FourthscreenState createState() => _FourthscreenState();
}

class _FourthscreenState extends State<Fourthscreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController surnamecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();

  getPhone() async {
    String value = await getPhone();
    print(value);
    if (value != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return People();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final peopleProvider = Provider.of<PeopleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(hintText: "Ad"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: surnamecontroller,
                decoration: InputDecoration(hintText: "Soyad"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: numbercontroller,
                decoration: InputDecoration(hintText: "Numara"),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: 120,
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade400,
                  child: Text("Add"),
                  onPressed: () async {
                    peopleProvider.setListuserData(
                      namecontroller.text,
                      surnamecontroller.text,
                      numbercontroller.text,
                    );
                    refreshScreen();

                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}