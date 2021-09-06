import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({Key? key}) : super(key: key);

  @override
  _SecondscreenState createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  List<String> listItems = List<String>.generate(100, (i) => 'Item $i');

  void showMessage() {}

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade400,
          centerTitle: true,
          title: Text("Recents"),
        ),
        body: ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Name Surname"),
                subtitle: Text(listItems[index]),
                trailing: IconButton(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: Icon(Icons.phone),
                  onPressed: () {},
                ),
                leading: IconButton(
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
              );
            }),
      ),
    );
  }
}
