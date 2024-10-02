
import 'package:a_t_chapter_8/Components/btn.dart';
import 'package:a_t_chapter_8/Components/styling.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(userInput.toString(),style:const TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.right,)),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text(answer,style:const TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.right,)),

                  ],
                ),
              )),
const SizedBox(height: 50,),
              Expanded(
                flex: 2,
                child: GridView.count(

                  crossAxisCount: 4,
                  children: [
                    button(title: 'AC',CallbackAction: (){
                      setState(() {
                        userInput = '';
                        answer = '';
                      });
                    },),
                    button(title: '+/-',CallbackAction: (){
                      setState(() {
                        userInput = '+/-';
                      });
                    },),
                    button(title: '%',CallbackAction: (){
                      setState(() {
                        userInput += '%';
                      });
                    },),
                    button(title: '/',CallbackAction: (){
                      setState(() {
                        userInput += '/';
                      });
                    },bgColor: bgOrange,),
                 // 2nd row
                    button(title: '7',
                      bgColor: bgShadow,
                      CallbackAction: (){
                      setState(() {
                        userInput += '7';
                      });
                    },),
                    button(title: '8', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '8';
                      });
                    },),
                    button(title: '9',  bgColor: bgShadow,CallbackAction: (){
                      setState(() {
                        userInput += '9';
                      });
                    },),
                    button(title: 'x',CallbackAction: (){
                      setState(() {
                        userInput += 'x';
                      });
                    },bgColor: bgOrange,),
                    //3rd row
                    button(title: '4', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '4';
                      });
                    },),
                    button(title: '5', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '5';
                      });
                    },),
                    button(title: '6', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '6';
                      });
                    },),
                    button(title: '-',CallbackAction: (){
                      setState(() {
                        userInput += '-';
                      });
                    },bgColor: bgOrange,),
                    //4th row

                    button(title: '1', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '1';
                      });
                    },),
                    button(title: '2', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '2';
                      });
                    },),

                    button(title: '3', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '3';
                      });
                    },),

                    button(title: '+',CallbackAction: (){
                      setState(() {
                        userInput += '+';
                      });
                    },bgColor: bgOrange,),
                    //5th row
                    button(title: '0', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '0';
                      });
                    },),
                    button(title: '.', bgColor: bgShadow, CallbackAction: (){
                      setState(() {
                        userInput += '.';
                      });
                    },),
                    button(title: 'DEL',CallbackAction: (){
                      setState(() {
                        userInput = userInput.substring(0,userInput.length - 1);
                      });
                    },),
                    button(title: '=',CallbackAction: (){
                      setState(() {
                        equalTo();
                      });
                    },bgColor: bgOrange,),

                  ],
                ),
              )

            ],
          ),
        ),
      ),

    );
  }

  void equalTo(){
    String finalString = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalString);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
     answer = eval.toString();
  }
}
