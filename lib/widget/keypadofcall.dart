import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool _visible=false;

dynamic createBtn(String btnVal, TextEditingController _cntNumberField,
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
             
            _cntNumberField.text += btnVal;
            
          },
          
        )),
  );
}

dynamic getKeypad(BuildContext context, TextEditingController cntNumberField) {
 
  
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
                controller: cntNumberField,
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
                    createBtn("1", cntNumberField, context),
                    createBtn("4", cntNumberField, context),
                    createBtn("7", cntNumberField, context),
                    createBtn("*", cntNumberField, context),
                  
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
                    createBtn("2", cntNumberField, context),
                    createBtn("5", cntNumberField, context),
                    createBtn("8", cntNumberField, context),
                    createBtn("0", cntNumberField, context),
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
                                      content: Text(cntNumberField.text),
                                    );
                                  });
                            },
                          )),
                    ),
                  ],
                ),
                Column(
                  children: [
                    createBtn("3", cntNumberField, context),
                    createBtn("6", cntNumberField, context),
                    createBtn("9", cntNumberField, context),
                    createBtn("#", cntNumberField, context),
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
                               if(cntNumberField.text!=null && cntNumberField.text.length>0){
                                 cntNumberField.text=cntNumberField.text.substring(0,cntNumberField.text.length-1);
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
