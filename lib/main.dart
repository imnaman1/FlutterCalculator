import 'package:calculator/widgets/cal_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalScreen(),
    );
  }
}

class CalScreen extends StatefulWidget {
  @override
  _CalScreenState createState() => _CalScreenState();
}

class _CalScreenState extends State<CalScreen> {
  String _expression = "";
  String _history = "";

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _expression = "";
      _history = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double? eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2E2C37),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 16),
              alignment: Alignment(1, 1),
              child: Text(
                _history,
                style:
                    GoogleFonts.rubik(fontSize: 24, color: Color(0xffBFBFC1)),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment(1, 1),
              child: Text(
                _expression,
                style: GoogleFonts.rubik(fontSize: 42),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: 'AC',
                  callback: allClear,
                ),
                CalButton(
                  text: '^',
                  callback: numClick,
                ),
                CalButton(
                  text: '%',
                  callback: numClick,
                ),
                CalButton(
                  text: '/',
                  fillColor: 0xffBFBFC1,
                  textColor: 0xff000000,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: '7',
                  callback: numClick,
                ),
                CalButton(
                  text: '8',
                  callback: numClick,
                ),
                CalButton(
                  text: '9',
                  callback: numClick,
                ),
                CalButton(
                  text: '*',
                  fillColor: 0xffBFBFC1,
                  textColor: 0xff000000,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: '4',
                  callback: numClick,
                ),
                CalButton(
                  text: '5',
                  callback: numClick,
                ),
                CalButton(
                  text: '6',
                  callback: numClick,
                ),
                CalButton(
                  text: '-',
                  fillColor: 0xffBFBFC1,
                  textColor: 0xff000000,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: '1',
                  callback: numClick,
                ),
                CalButton(
                  text: '2',
                  callback: numClick,
                ),
                CalButton(
                  text: '3',
                  callback: numClick,
                ),
                CalButton(
                  text: '+',
                  fillColor: 0xffBFBFC1,
                  textColor: 0xff000000,
                  callback: numClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  text: '0',
                  callback: numClick,
                ),
                CalButton(
                  text: '.',
                  callback: numClick,
                ),
                CalButton(
                  text: '00',
                  callback: numClick,
                ),
                CalButton(
                  text: '=',
                  fillColor: 0xffBFBFC1,
                  textColor: 0xff000000,
                  callback: evaluate,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
