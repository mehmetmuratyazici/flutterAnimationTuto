import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PeopleProvider with ChangeNotifier {
  List<String>? nameList = <String>[];
  List<String>? surnameList = <String>[];
  List<String>? numberList = <String>[];

  List<String>? favNameList = <String>[];
  List<String>? favSurnameList = <String>[];
  List<String>? favNumberList = <String>[];

  bool checkIsFav(index) {
    for (final contact in favNameList!) {
      if (contact == nameList![index]) {
        return true;
      }
    }
    return false;
  }

  addFavorite(int index) {
    favNameList!.add(nameList![index]);
    favSurnameList!.add(surnameList![index]);
    favNumberList!.add(numberList![index]);
    notifyListeners();
  }

  removeFavorite(int index) {
    favNameList!.removeWhere((element) => element == nameList![index]);
    favSurnameList!.removeWhere((element) => element == surnameList![index]);
    favNumberList!.removeWhere((element) => element == numberList![index]);
    notifyListeners();
  }

  setListuserData(String name, String surname, String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList("nameList") != null) {
      nameList = (prefs.getStringList("nameList"))!;
      surnameList = (prefs.getStringList("surnameList"))!;
      numberList = (prefs.getStringList("numberList"))!;
    }
    nameList!.add(name);
    surnameList!.add(surname);
    numberList!.add(number);
    notifyListeners();
    await prefs.setStringList("nameList", nameList!);
    await prefs.setStringList("surnameList", surnameList!);
    await prefs.setStringList("numberList", numberList!);
  }

  getContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameList = (prefs.getStringList("nameList") != null
        ? prefs.getStringList("nameList")
        : <String>[]);
    surnameList = (prefs.getStringList("surnameList") != null
        ? prefs.getStringList("surnameList")
        : <String>[]);
    numberList = (prefs.getStringList("numberList") != null
        ? prefs.getStringList("numberList")
        : <String>[]);
    print("cağrıldı");

    notifyListeners();
  }
}