// ignore_for_file: unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';
  
const Color darkBlue = Color.fromARGB(255, 80, 107, 135);
void main() {
  runApp(MyApp());
}
  
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); // MaterialApp
  }
}
  
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
  var userInput = '';
  var answer = '';
  
  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color.fromARGB(248, 42, 41, 41),
         title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('calculadora'),
      
    ],
  ),
      ), //AppBar
      backgroundColor: Color.fromARGB(255, 50, 50, 50),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(26),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 28, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 35,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            
            flex: 3,
            
            child: Container(
              
              child: GridView.builder(
                
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Color.fromARGB(233, 1, 37, 87),
                        textColor: Color.fromARGB(255, 255, 255, 255),
                      );
                    }
  
                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: buttons[index],
                                color: Color.fromARGB(233, 1, 37, 87),
                        textColor: Color.fromARGB(255, 255, 255, 255),
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                             color: Color.fromARGB(233, 1, 37, 87),
                        textColor: Color.fromARGB(255, 255, 255, 255),
                      );
                    }
                    // Delete Button
                    else if (index == 3) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                          color:  Color.fromARGB(255, 71, 106, 168),
                        textColor: Color.fromARGB(255, 0, 0, 0),
                      );
                    }
                    // Equal_to Button
                    else if (index == 18) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orange[700],
                        textColor: Color.fromARGB(255, 0, 0, 0),
                      );
                    }
  
                    //  other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Color.fromARGB(255, 71, 106, 168)
                            : Color.fromARGB(255, 111, 111, 112),
                        textColor: isOperator(buttons[index])
                            ? Color.fromARGB(255, 0, 0, 0)
                            : Color.fromARGB(255, 0, 0, 0),
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }
  
  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
  
// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
  
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}