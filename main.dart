import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => __MyHomePageState();
}

class __MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String local_store ='0';
  double value1 = 0;
  double value2 = 0;
  String sign = "";
  String store = "";

  Widget buildbutton(String buttonValue, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: () {
            setState(() {
              if (buttonValue == 'C') {
                local_store = '0';
                value1 = 0;
                value2 = 0;
                sign = "";
              } else if (buttonValue == '+' ||
                  buttonValue == '-' ||
                  buttonValue == 'x' ||
                  buttonValue == '/' ||
                  buttonValue == '%') {
                value1 = double.parse(output);
                sign = buttonValue;
                local_store = '0';
              } else if (buttonValue == '.') {
                local_store = local_store +
                    buttonValue;
              } else if (buttonValue == "=") {
                value2 = double.parse(output);

                if (sign == '+') {
                  local_store = (value1 + value2).toString();
                } else if (sign == '-') {
                  local_store = (value1 - value2).toString();
                } else if (sign == 'x') {
                  local_store = (value1 * value2).toString();
                } else if (sign == '/') {
                  local_store = (value1 / value2).toString();
                } else if (sign == '%') {
                  local_store = (value1 % value2).toString();
                }

                value1 = 0;
                value2 = 0;
                sign = "";
              } else {
                local_store = local_store + buttonValue;
              }
              setState(() {
                output = double.parse(local_store).toStringAsFixed(
                    2);
              });

              if(buttonValue!= 'C'){
                store = store + buttonValue;
              }
              else{
                store = '';
              }

            });
          },

          child: Container(
            child: Text(
              buttonValue,
              style: TextStyle(
                  fontSize: 30, color: Colors.orange),
            ),
            padding: EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("201071032",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.5),
                child: Text(
                  store,
                  style: TextStyle(
                    fontSize: 30,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(12.5, 12.5, 12.5, 25),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 85,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      buildbutton("C", 1),
                      buildbutton("/", 2),
                      buildbutton("%", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("7", 1),
                      buildbutton("8", 1),
                      buildbutton("9", 1),
                      buildbutton("x", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("4", 1),
                      buildbutton("5", 1),
                      buildbutton("6", 1),
                      buildbutton("-", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("1", 1),
                      buildbutton("2", 1),
                      buildbutton("3", 1),
                      buildbutton("+", 1),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("0", 1),
                      buildbutton(".", 1),
                      buildbutton("=", 2),
                    ],
                  ),
                ],
              ),


            ],
          )),
    );
  }
}

