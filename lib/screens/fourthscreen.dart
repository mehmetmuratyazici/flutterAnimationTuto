
import 'package:animation_tuto/widget/people.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fourthscreen extends StatefulWidget {
  const Fourthscreen({Key? key}) : super(key: key);

  @override
  _FourthscreenState createState() => _FourthscreenState();
}

class _FourthscreenState extends State<Fourthscreen> {
  List<String> nameList = <String>[];
  List<String> surnameList = <String>[];
  List<String> numberList = <String>[];
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController surnamecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();

  setListuserData(String name, String surname, String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList("nameList") != null) {
      nameList = (prefs.getStringList("nameList"))!;
      surnameList = (prefs.getStringList("surnameList"))!;
      numberList = (prefs.getStringList("numberList"))!;
    }
    nameList.add(name);
    surnameList.add(surname);
    numberList.add(number);

    await prefs.setStringList("nameList", nameList);
    await prefs.setStringList("surnameList", surnameList);
    await prefs.setStringList("numberList", numberList);
  }

  Future<List<String>?> getListData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.getStringList("name");
    prefs.getStringList("surname");
    prefs.getStringList("number");
    
  }

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
                    setListuserData(
                      namecontroller.text,
                      surnamecontroller.text,
                      numbercontroller.text,
                    );
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