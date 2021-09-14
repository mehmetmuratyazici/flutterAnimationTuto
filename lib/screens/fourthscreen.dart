import 'package:animation_tuto/widget/people.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController name=TextEditingController();
TextEditingController surname=TextEditingController();
TextEditingController numara=TextEditingController();

class Fourthscreen extends StatefulWidget {
  const Fourthscreen({ Key? key }) : super(key: key);

  @override
  _FourthscreenState createState() => _FourthscreenState();
}

class _FourthscreenState extends State<Fourthscreen> {
  var user;


  

 setListuserData(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("name",user.name);
    prefs.setStringList("surname",user.surname);
    prefs.setStringList("numara",user.numara);

  }
 
  Future<List<String>?> getListData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.getStringList("name");
    prefs.getStringList("surname");
    prefs.getStringList("numara");
    
  }
    getPhone() async {
    String value = await getPhone();
    print(value);
    if (value != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return People();
      }));
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
              padding:EdgeInsets.all(20),
              child: TextField(
                decoration:InputDecoration(hintText:"Ad" ),
                ),
              ),
            Padding(
              padding: EdgeInsets.all(20),
                child: TextField(
                decoration:InputDecoration(hintText:"Soyad" ),
                ),              
              ),
              Padding(
              padding: EdgeInsets.all(20),
                child: TextField(
                decoration:InputDecoration(hintText:"Numara" ),
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
                 onPressed: () { 
                    setListuserData(user).then((value){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>People()),
                  );
                    },
                    );
                 }
                                    ),
                 
                  )
             )
           

        ],
        ),
      ),
      
      );
      
  } 
      
  }
