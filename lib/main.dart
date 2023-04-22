import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? firstNum, secondNum;
  String? textToDisplay;
  String? result;
  String? operationToPerform;
  void actionPerform(String function) {
    if (function == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      result = '0';
    } else if (function == '+' ||
        function == '-' ||
        function == '/' ||
        function == 'x') {
      firstNum = int.parse(textToDisplay!);
      result = '';
      operationToPerform = function;
    } else if (function == '=') {
      secondNum = int.parse(textToDisplay!);
      if (operationToPerform == "+") {
        result = (firstNum! + secondNum!).toString();
      }
      if (operationToPerform == "-") {
        result = (firstNum! - secondNum!).toString();
      }
      if (operationToPerform == "/") {
        result = (firstNum! / secondNum!).toString();
      }
      if (operationToPerform == "x") {
        result = (firstNum! * secondNum!).toString();
      }
    } else {
      result = int.parse(textToDisplay! + function).toString();
    }
    setState(() {
      textToDisplay = result;
    });
  }

  Widget customButtom(String function) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.teal,
            offset: Offset(4, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: MaterialButton(
        onPressed: () => actionPerform(function),
        child: Container(
            height: 50,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(4, 4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Text(
                " $function ",
                style: const TextStyle(color: Colors.black),
              ),
            )),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: SafeArea(
          child: Container(
        // padding: const EdgeInsets.only(bottom: -),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '$textToDisplay',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ))),
            Row(
              children: [
                customButtom('9'),
                customButtom('8'),
                customButtom('7'),
                customButtom('C'),
              ],
            ),
            Row(
              children: [
                customButtom('6'),
                customButtom('5'),
                customButtom('4'),
                customButtom('+'),
              ],
            ),
            Row(
              children: [
                customButtom('3'),
                customButtom('2'),
                customButtom('1'),
                customButtom('-'),
              ],
            ),
            Row(
              children: [
                customButtom('='),
                customButtom('0'),
                customButtom('x'),
                customButtom('/'),
              ],
            )
          ],
        ),
      )),
    );
  }
}
