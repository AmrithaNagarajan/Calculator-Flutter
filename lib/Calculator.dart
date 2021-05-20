import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var value="";
  var exp="";
  var result=0;
  var operator="+";
  bool pressed = false;
  int calcalate(int a, int b, String op){
    if (op=="+"){
      return a+b;
    }
    else if(op=="-"){
      return a-b;
    }
    else if(op=="X"){
      return a*b;
    }
    else if(op=="/"){
      return (a/b) as int;
    }
  }
  void operation(String op){
    switch(op){
      case "0":{
        setState(() {
          value=value+"0";
          exp=exp+"0";
        });

      }
      break;
      case "1":{
        setState(() {
          value=value+"1";
          exp=exp+"1";
        });
      }
      break;
      case "2":{
        setState(() {
          value=value+"2";
          exp=exp+"2";
        });
      }
      break;
      case "3":{
        setState(() {
          value=value+"3";
          exp=exp+"3";
        });
      }
      break;
      case "4":{
        setState(() {
          value=value+"4";
          exp=exp+"4";
        });
      }
      break;
      case "5":{
        setState(() {
          value=value+"5";
          exp=exp+"5";
        });
      }
      break;
      case "6":{
        setState(() {
          value=value+"6";
          exp=exp+"6";
        });
      }
      break;
      case "7":{
        setState(() {
          value=value+"7";
          exp=exp+"7";
        });
      }
      break;
      case "8":{
        setState(() {
          value=value+"8";
          exp=exp+"8";
        });
      }
      break;
      case "9":{
        setState(() {
          value=value+"9";
          exp=exp+"9";
        });
      }
      break;
      case "+":{
        setState(() {
          result=calcalate(result, int.parse(value) , operator);
          operator="+";
          value="";
          exp=result.toString()+ "+";
        });
      }
      break;
      case "-":
        {
          setState(() {
            result=calcalate(result, int.parse(value) , operator);
            operator="-";
            value = "";
            exp = result.toString() + " - " + value;
          });
        }
      break;
      case "x":{
        setState(() {
          result=calcalate(result, int.parse(value) , operator);
          operator="x";
          value="";
          exp=result.toString()+ " * " +value;
        });
      }
      break;
      case "/":{
        setState(() {
          result=calcalate(result, int.parse(value) , operator);
          operator="/";
          value="";
          exp=result.toString()+ " / " +value;
        });
      }
      break;
      case "=":{
        setState(() {
          result=calcalate(result, int.parse(value) , operator);
          value=value+"0";
          exp=result.toString();
        });
      }
      break;
      case "C":{
        setState(() {
          value="";
          exp="";
          result=0;
        });
      }
      break;

    }
  }
  Widget _button (String number) {
    return OrientationBuilder(
        builder:(context, orientation){
          return FlatButton(
            minWidth: (orientation==Orientation.portrait) ? MediaQuery.of(context).size.width*0.25 : MediaQuery.of(context).size.width*0.2,
            height: (orientation==Orientation.portrait) ? (MediaQuery.of(context).size.height*0.75)*0.25 :(MediaQuery.of(context).size.height*0.8)*0.5,
            color: Colors.red[200],    //pressed?Colors.black:Colors.red[200],
            textColor: Colors.white,
            child: Text(number, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            onPressed: ()=>[
              /*setState((){
                pressed=!pressed;
              }),*/
              operation(number),
            ],


          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {

    print(MediaQuery.of(context).orientation);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title:Text("Calculator",style: TextStyle(fontSize: 25),),
      ),
      body:OrientationBuilder(
        builder:(context,orientation){
          return Container(
            child:Column(
              children: [
                Expanded(
                  flex: 1,
                  child:Container(
                    //width: MediaQuery.of(context).size.width,
                    //height: orientation==Orientation.portrait?MediaQuery.of(context).size.height*0.25:MediaQuery.of(context).size.height*0.20,
                    child:Container(
                      color:Colors.red[50],
                      child:Align(alignment: Alignment.bottomRight,
                        child:Text("$exp",style: TextStyle(fontSize: 50),),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    child:GridView.count(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      crossAxisCount: orientation==Orientation.portrait?4:8,
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      children: (orientation==Orientation.portrait)?[
                        _button("7"),
                        _button("8"),
                        _button("9"),
                        _button("+"),
                        _button("4"),
                        _button("5"),
                        _button("6"),
                        _button("-"),
                        _button("1"),
                        _button("2"),
                        _button("3"),
                        _button("x"),
                        _button("C"),
                        _button("0"),
                        _button("="),
                        _button("/"),
                      ]:[
                        _button("9"),
                        _button("8"),
                        _button("7"),
                        _button("6"),
                        _button("5"),
                        _button("+"),
                        _button("-"),
                        _button("x"),
                        _button("0"),
                        _button("1"),
                        _button("2"),
                        _button("3"),
                        _button("4"),
                        _button("C"),
                        _button("="),
                        _button("/"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

