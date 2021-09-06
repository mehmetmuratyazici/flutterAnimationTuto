
import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({ Key? key }) : super(key: key);

  @override
  _SecondscreenState createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
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
      title: Text("Phone Book"),
      
      ),
    
        body:  Center(
          child: Container(
            // height: 200,
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 1,
              childAspectRatio: (1 / .2),
              children: [
               
                Card(
                  margin: EdgeInsets.all(10),   
                     
                  color: Colors.red.shade400,
                  child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person),radius: 15,),
                  title: Text("Fatma Ustaömer"),
                  subtitle: Text("05385457619"),
                  trailing: Icon(Icons.call),
              ),
                ),
                Card(
                  margin: EdgeInsets.all(10),            
                  color: Colors.red.shade400,
                  child: ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person),radius: 15,),
                  title: Text("Berk Gürsoy"),
                  subtitle: Text("05374586935"),
                  trailing: Icon(Icons.call),
              ),
                ),
                Card(
                 margin: EdgeInsets.all(10),            
                 color: Colors.red.shade400,
                 child: ListTile(
                 leading: CircleAvatar(child: Icon(Icons.person),radius: 15,),
                 title: Text("Aleyna Emir"),
                 subtitle: Text("05459873612"),
                 trailing: Icon(Icons.call),
              ),
                ),
                 Card(
                 margin: EdgeInsets.all(10),            
                 color: Colors.red.shade400,
                 child: ListTile(
                 leading: CircleAvatar(child: Icon(Icons.person),radius: 15,),
                 title: Text("Aleyna Emir"),
                 subtitle: Text("05459873612"),
                 trailing: Icon(Icons.call),
              ),
                ),
                 Card(
                 margin: EdgeInsets.all(10),            
                 color: Colors.red.shade400,
                 child: ListTile(
                 leading: CircleAvatar(child: Icon(Icons.person),radius: 15,),
                 title: Text("Aleyna Emir"),
                 subtitle: Text("05459873612"),
                 trailing: Icon(Icons.call),
              ),
                ),
                 Card(
                 margin: EdgeInsets.all(10),            
                 color: Colors.red.shade400,
                 child: ListTile(
                 leading: CircleAvatar(child: Icon(Icons.person),radius: 15,),
                 title: Text("Aleyna Emir"),
                 subtitle: Text("05459873612"),
                 trailing: Icon(Icons.call),
              ),
                ),
              
                
              ],
            ),
          ),
        ),
      ),
    );
      
    
  }
}