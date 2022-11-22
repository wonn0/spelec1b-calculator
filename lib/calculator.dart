import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import './calcbutton.dart';
import './constants/constants.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = '';
  String answer = '';

  void handleSubmit() {
    String s = userInput;
    s = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression e = p.parse(s);
    ContextModel cm = ContextModel();
    double eval = e.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ), //AppBar
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return CalcButton(
                        label: buttons[index], 
                        onPress: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        }
                      );
                    }
                    else if (index == 1) {
                      return CalcButton(
                        label: buttons[index],
                        onPress: () {}
                      );
                    }
                    else if (index == 3) {
                      return CalcButton(
                        label: buttons[index],
                        onPress: () {
                          setState(() {
                            userInput = userInput.substring(0, userInput.length - 1);
                          });
                        }
                      );
                    }
                    else if (index == 18) {
                      return CalcButton(
                        label: buttons[index], 
                        onPress: () {
                          setState(() {
                            handleSubmit();
                          });
                        }
                      );
                    }
                    else {
                      return CalcButton(
                        label: buttons[index],
                        onPress: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        }
                      );
                    }
                  },
                )
              )
            ),
        ],
      ),
    );
  }
}