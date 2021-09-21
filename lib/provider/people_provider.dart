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
    saveFavLists();
    notifyListeners();
  }

  removeFavorite(int index) {
    favNameList!.remove(nameList![index]);
    favSurnameList!.remove(surnameList![index]);
    favNumberList!.remove(numberList![index]);
    saveFavLists();
    notifyListeners();
  }

  saveFavLists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList("favNameList", favNameList!);
    await prefs.setStringList("favSurnameList", favSurnameList!);
    await prefs.setStringList("favNumberList", favNumberList!);
  }

  setListuserData(String name, String surname, String number) {
    nameList!.add(name);
    surnameList!.add(surname);
    numberList!.add(number);
    saveListContact();
    notifyListeners();
  }

  saveListContact() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

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

    favNameList = (prefs.getStringList("favNameList") != null
        ? prefs.getStringList("favNameList")
        : <String>[]);
    favSurnameList = (prefs.getStringList("favSurnameList") != null
        ? prefs.getStringList("favSurnameList")
        : <String>[]);
    favNumberList = (prefs.getStringList("favNumberList") != null
        ? prefs.getStringList("favNumberList")
        : <String>[]);
    print("cağrıldı");

    notifyListeners();
  }
}
