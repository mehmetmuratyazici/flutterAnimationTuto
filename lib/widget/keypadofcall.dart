import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetKeyPad extends StatefulWidget {
  final TextEditingController cntNumberField;
  const GetKeyPad({ Key? key,required this.cntNumberField, }) : super(key: key);

  @override
  _GetKeyPadState createState() => _GetKeyPadState();
}

class _GetKeyPadState extends State<GetKeyPad> {
  bool _visible=false;
 
  
  @override
  Widget build(BuildContext context) {
    final gblWidth = MediaQuery.of(context).size.width * .9;
  return Scaffold(
    body: Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: SizedBox(
              width: gblWidth,
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 30,
                ),
                showCursor: false,
                controller: this.widget.cntNumberField,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  //hintText: 'Please type number',
                ),
              ),
            ),
          ),
          SizedBox(
            width: gblWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [                
                Column(
                  children: [                   
                    createBtn("1", this.widget.cntNumberField, context),
                    createBtn("4", this.widget.cntNumberField, context),
                    createBtn("7", this.widget.cntNumberField, context),
                    createBtn("*", this.widget.cntNumberField, context),
                  
                    Padding(
                      //bunu yapmak hiç istemezdim ama columun un anlmasız bir bug ı var
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .05 + 30,
                        height: MediaQuery.of(context).size.width * .05 + 30,
                        child: Visibility(
                          visible: false,
                          child: FloatingActionButton(
                            child: Icon(null),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    createBtn("2", this.widget.cntNumberField, context),
                    createBtn("5", this.widget.cntNumberField, context),
                    createBtn("8", this.widget.cntNumberField, context),
                    createBtn("0", this.widget.cntNumberField, context),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * .05 + 30,
                          height: MediaQuery.of(context).size.width * .05 + 30,
                          child: FloatingActionButton(
                            backgroundColor: Colors.red.shade700,
                            child: Icon(Icons.call),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(this.widget.cntNumberField.text),
                                    );
                                  });
                            },
                          )),
                    ),
                  ],
                ),
                Column(
                  children: [
                    createBtn("3", this.widget.cntNumberField, context),
                    createBtn("6", this.widget.cntNumberField, context),
                    createBtn("9", this.widget.cntNumberField, context),
                    createBtn("#", this.widget.cntNumberField, context),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .05 + 30,
                        height: MediaQuery.of(context).size.width * .05 + 30,
                        child: Visibility(
                         
                            visible:_visible,
                                                       
                            child: IconButton(
                              icon: Icon(Icons.backspace),
                              onPressed: () {                                                             
                               if(this.widget.cntNumberField.text!=null && this.widget.cntNumberField.text.length>0){
                                 this.widget.cntNumberField.text=this.widget.cntNumberField.text.substring(0,this.widget.cntNumberField.text.length-1);
                                 if (this.widget.cntNumberField.text == '') {
                                    setState(() {
                                      _visible = false;
                                    });
                                  }
                               }
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

        
 createBtn(String btnVal, TextEditingController _cntNumberField,
    BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: SizedBox(
        width: MediaQuery.of(context).size.width * .05 + 30,
        height: MediaQuery.of(context).size.width * .05 + 30,
        child: FloatingActionButton(
          heroTag: "btn" + btnVal,
          backgroundColor: Colors.grey.shade700,
          child: Text(
            btnVal,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * .005 + 25,
              color: Colors.white,
            ),
          ),
          onPressed: ()
           {  
              if (_cntNumberField.text == "") {
              setState(() {
                _visible = true;
              });
            }
            _cntNumberField.text += btnVal;
            
          },
        
        )),
  );
}
}