import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

dynamic call() {
  final number = TextEditingController();
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            
            controller: number,
            decoration: new InputDecoration(
                suffixIcon: IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () {
                if (number.text != null && number.text.length > 0) {
                  number.text =
                      number.text.substring(0, number.text.length - 1);
                }
              },
            )),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.grey,
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {
                    number.text = number.text + '1';
                  },
                ),
                FloatingActionButton(
                  backgroundColor: Colors.grey,
                  onPressed: () {
                     number.text = number.text + '2';
                  },
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.grey,
                  onPressed: () {
                     number.text = number.text + '3';
                  },
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  backgroundColor: Colors.grey,
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {
                     number.text = number.text + '4';
                  }),
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {
                   number.text = number.text + '5';
                },
                child: Text(
                  "5",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () { 
                  number.text = number.text + '6';
                  },
                child: Text(
                  "6",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {
                   number.text = number.text + '7';
                },
                child: Text(
                  "7",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {
                   number.text = number.text + '8';
                },
                child: Text(
                  "8",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {
                   number.text = number.text + '9';
                },
                child: Text(
                  "9",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {
                   number.text = number.text + '*';
                },
                child: Text(
                  "*",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {
                   number.text = number.text + '0';
                },
                child: Text(
                  "0",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {
                   number.text = number.text + '#';
                },
                child: Text(
                  "#",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    
    floatingActionButton: FloatingActionButton(
        child: Icon(Icons.phone),
        backgroundColor: Colors.red.shade400,
        onPressed: () {}),
  );
}