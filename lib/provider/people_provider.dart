import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PeopleProvider with ChangeNotifier {
  List<String> nameList = <String>[];
  List<String> surnameList = <String>[];
  List<String> numberList = <String>[];

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
    notifyListeners();
    await prefs.setStringList("nameList", nameList);
    await prefs.setStringList("surnameList", surnameList);
    await prefs.setStringList("numberList", numberList);
  }

  getContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameList = (prefs.getStringList("nameList"))!;
    surnameList = (prefs.getStringList("surnameList"))!;
    numberList = (prefs.getStringList("numberList"))!;
    print("cağrıldı");

    notifyListeners();
  }
}