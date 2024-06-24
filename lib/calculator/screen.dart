import 'package:calculator/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var userinput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(userinput,
                      style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w900)),
                  Text("Ans= $answer",
                      style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w900))
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(
                        title: "AC",
                        onPressed: () {
                          userinput = "";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "+/-",
                        onPressed: () {
                          userinput += "+/-";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "%",
                        onPressed: () {
                          userinput += "%";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "/",
                        color: Colors.orange,
                        onPressed: () {
                          userinput += "/";
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(
                        title: "7",
                        onPressed: () {
                          userinput += "7";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "8",
                        onPressed: () {
                          userinput += "8";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "9",
                        onPressed: () {
                          userinput += "9";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "x",
                        color: Colors.orange,
                        onPressed: () {
                          userinput += "x";
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(
                        title: "4",
                        onPressed: () {
                          userinput += "4";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "5",
                        onPressed: () {
                          userinput += "5";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "6",
                        onPressed: () {
                          userinput += "6";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "-",
                        color: Colors.orange,
                        onPressed: () {
                          userinput += "-";
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(
                        title: "1",
                        onPressed: () {
                          userinput += "1";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "2",
                        onPressed: () {
                          userinput += "2";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "3",
                        onPressed: () {
                          userinput += "3";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "+",
                        color: Colors.orange,
                        onPressed: () {
                          userinput += "+";
                          setState(() {});
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(
                        title: "0",
                        onPressed: () {
                          userinput += "0";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: ".",
                        onPressed: () {
                          userinput += ".";
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "DEL",
                        onPressed: () {
                          userinput = userinput.substring(0, userinput.length - 1);
                          setState(() {});
                        },
                      ),
                      Buttons(
                        title: "=",
                        color: Colors.orange,
                        onPressed: () {
                          getanswer();
                          setState(() {});
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getanswer() {
    String finaluserinput;
    finaluserinput = userinput.replaceAll("x", "*");
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
