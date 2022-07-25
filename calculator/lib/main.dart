import 'package:calculator/theme.dart';
import 'package:calculator/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int firstNum;
  late int secondNum;
  late String history='' ;
  String texttodisplay='' ;
  String res='';
  String? operation;

  void buttonclick(String btnVal) {

    if(btnVal=='C'){ texttodisplay='';firstNum=0;secondNum=0;res='';}
    else if (btnVal=='AC'){texttodisplay='';firstNum=0;secondNum=0;res='';history='';}
    else if(btnVal=='+'||btnVal=='-'||btnVal=='X'||btnVal=='/'){
      firstNum=int.parse(texttodisplay);
      operation=btnVal;
      res='';
    }
    else if(btnVal=="+/-"){
      if(texttodisplay[0]!='-'){res='-' + texttodisplay;}
      else {res=texttodisplay.replaceAll("-", "");}
    }
    else if(btnVal=="<"){res=texttodisplay.substring(0,texttodisplay.length-1);}
    else if(btnVal=='='){
      secondNum=int.parse(texttodisplay);
      if(operation=='+'){
        res=(firstNum+secondNum).toString();
        history=firstNum.toString()+operation.toString()+secondNum.toString();
      }
      else if(operation=='-'){
        res=(firstNum-secondNum).toString();
        history=firstNum.toString()+operation.toString()+secondNum.toString();
      }
      else if(operation=='X'){
        res=(firstNum*secondNum).toString();
        history=firstNum.toString()+operation.toString()+secondNum.toString();
      }
      else if(operation=='/'){
        res=(firstNum/secondNum).toString();
        history=firstNum.toString()+operation.toString()+secondNum.toString();
      }


      }
    else {res=int.parse(texttodisplay+btnVal).toString();}
    setState((){texttodisplay=res;});

    }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        bottomOpacity: 0.0,
        backgroundColor: Colors.black,
        title: "Simple Calculator".text.make(),

      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Container(
              padding: const EdgeInsets.only(right: 17.00, bottom: 19.00),
              alignment: Alignment.bottomRight,
              child: history.text.xl4.color(Colors.white38).make(),
            ),
            Container(
              padding: const EdgeInsets.only(right: 17.00, bottom: 19.00),
              alignment: Alignment.bottomRight,
              child: texttodisplay.text.xl6.white.make(),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(
                    number: "AC", color: coloring.lime, callback: buttonclick,),
                  Buttons(
                    number: "C", color: coloring.lime, callback: buttonclick,),
                  Buttons(number: "<",
                    color: coloring.orange,
                    callback: buttonclick,),
                  Buttons(number: "/",
                    color: coloring.orange,
                    callback: buttonclick,),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  number: "9", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "8", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "7", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "X", color: coloring.orange, callback: buttonclick,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  number: "6", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "5", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "4", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "-", color: coloring.orange, callback: buttonclick,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  number: "3", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "2", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "1", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "+", color: coloring.orange, callback: buttonclick,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(
                  number: "+/-", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "0", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "00", color: coloring.lime, callback: buttonclick,),
                Buttons(
                  number: "=", color: coloring.orange, callback: buttonclick,),
              ],
            )
          ]
      ),
    );
  }
}
