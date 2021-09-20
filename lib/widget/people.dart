import 'package:animation_tuto/provider/people_provider.dart';
import 'package:animation_tuto/screens/fourthscreen.dart';
import 'package:animation_tuto/widget/favorites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

void changeScreen(BuildContext _context, Widget _widget) {
  Navigator.push(_context, MaterialPageRoute(builder: (_context) => _widget));
}

void refreshScreen() async {
  //await _PeopleState()._formKey.currentState.widget.createState();
}

@override
class _PeopleState extends State<People> {
  initState() {
    Provider.of<PeopleProvider>(context, listen: false).getContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final peopleProvider = Provider.of<PeopleProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: peopleProvider.nameList!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.grey.shade800,
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Favorites(
                                nameList: peopleProvider.nameList![index],
                                surnameList: peopleProvider.surnameList![index],
                                numberList: peopleProvider.numberList![index],
                                index:index
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.person)),
                    subtitle: Text(peopleProvider.numberList![index]),
                    title: Text(
                      peopleProvider.nameList![index] +
                          " " +
                          peopleProvider.surnameList![index],
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
              onPressed: () {
                changeScreen(context, Fourthscreen());
              },
              iconSize: 30,
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
