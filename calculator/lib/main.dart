import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0.00";
  String _output;
  double num1, num2;
  String op;

  @override
  initState() {
    super.initState();

    _output = "0";
    resetState();
  }

  void resetState() {
    num1 = 0.0;
    num2 = 0.0;
    op = "";
  }

  void buttonPressed(String buttonText) {
    switch (buttonText) {
      case "Clear":
        _output = "0";
        resetState();
        break;
      case "+":
      case "-":
      case "X":
      case "/":
        num1 = double.parse(output);
        op = buttonText;
        _output = "0";
        break;
      case ".":
        if (!_output.contains(".")) {
          _output = _output + buttonText;
        }
        break;
      case "=":
        num2 = double.parse(output);
        runOperation();
        resetState();
        break;
      default:
        _output = _output + buttonText;
        break;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  void runOperation() {
    switch (op) {
      case "+":
        _output = (num1 + num2).toString();
        break;
      case "-":
        _output = (num1 - num2).toString();
        break;
      case "X":
        _output = (num1 * num2).toString();
        break;
      case "/":
        _output = (num1 / num2).toString();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 150.0, bottom: 150.0),
          child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 12.0,
            ),
            child: Text(
              output,
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
              ],
            ),
            Row(
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X"),
              ],
            ),
            Row(
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),
              ],
            ),
            Row(
              children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),
              ],
            ),
            Row(
              children: [
                buildButton("Clear"),
                buildButton("="),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: RaisedButton(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 30.0),
          ),
          onPressed: () {
            buttonPressed(buttonText);
          },
        ),
      ),
    );
  }
}
