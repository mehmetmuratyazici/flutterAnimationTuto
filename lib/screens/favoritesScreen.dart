import 'package:animation_tuto/provider/people_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final fav= Provider.of<PeopleProvider>(context);
    return ListView.builder(
      itemCount:fav.favNameList!.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(fav.favNameList![index]+' '+fav.favSurnameList![index]),
          subtitle: Text(fav.favNumberList![index]),
          trailing: IconButton(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Icon(Icons.phone),
            onPressed: () {
              
            },
          ),
        
        );
      },
    );
  }
}
