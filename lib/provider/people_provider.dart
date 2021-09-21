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
    SharedPreferences fav = await SharedPreferences.getInstance();

    if (fav.getStringList("nameList") != null) {
      nameList = (fav.getStringList("nameList"))!;
      surnameList = (fav.getStringList("surnameList"))!;
      numberList = (fav.getStringList("numberList"))!;
    }
    nameList!.add(name);
    surnameList!.add(surname);
    numberList!.add(number);
    notifyListeners();
    await fav.setStringList("nameList", nameList!);
    await fav.setStringList("surnameList", surnameList!);
    await fav.setStringList("numberList", numberList!);
  }

  getContact() async {
    SharedPreferences fav = await SharedPreferences.getInstance();
    nameList = (fav.getStringList("nameList") != null
        ? fav.getStringList("nameList")
        : <String>[]);
    surnameList = (fav.getStringList("surnameList") != null
        ? fav.getStringList("surnameList")
        : <String>[]);
    numberList = (fav.getStringList("numberList") != null
        ? fav.getStringList("numberList")
        : <String>[]);
    print("cağrıldı");

    notifyListeners();
  }
}