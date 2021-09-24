import 'package:animation_tuto/provider/people_provider.dart';
import 'package:animation_tuto/widget/people.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

void changeScreen(BuildContext _context, Widget _widget) {
  Navigator.push(_context, MaterialPageRoute(builder: (_context) => _widget));
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool editing = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<PeopleProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
        title: Text("Favorites"),
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Icon(Icons.add),
            onPressed: () {
              changeScreen(context, People());
            },
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  visible = true;
                  editing = !editing;
                });
                visible = editing;
              },
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              iconSize: 50,
              icon: Text(
                "Düzenle",
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: fav.favNameList!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        left: !editing ? -50 : 0,
                        child: Center(
                          child: SizedBox(
                            width: 50,
                            child: FloatingActionButton(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                foregroundColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onPressed: () {},
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                )),
                          ),
                        ),
                        duration: Duration(milliseconds: 200),
                      ),
                      AnimatedPositioned(
                        left: editing ? 50 : 0,
                        duration: Duration(milliseconds: 200),
                        //curve: Curves.bounceInOut,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            title: Text(fav.favNameList![index] +
                                ' ' +
                                fav.favSurnameList![index]),
                            subtitle: Text(fav.favNumberList![index]),
                            trailing: SizedBox(
                              width: 50,
                              child: IconButton(
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                icon: Icon(Icons.phone),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(fav.favNumberList![index]),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
