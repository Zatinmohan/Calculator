import 'package:calculator/bottomFunc.dart';
import 'package:calculator/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _expression = '';
  String _history = '';
  bool _isDarkSelected = true;

  void numClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void calculate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: DarkLight(), //For dark and light mode
                ),
                ResultSection(
                    history: _history,
                    expression: _expression), //Show Result and typed data
              ],
            ),
          ),
          Container(
              //Button Container
              padding: EdgeInsets.only(
                top: 25.0,
                left: 10.0,
                right: 10.0,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsSection(
                          text: "AC",
                          color: Color(0xff57c2b2),
                          callback: allClear,
                        ),
                        ButtonsSection(
                          text: "C",
                          color: Color(0xff57c2b2),
                          callback: clear,
                        ),
                        ButtonsSection(
                          text: "%",
                          color: Color(0xff57c2b2),
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "/",
                          color: Color(0xfffd5c63),
                          callback: numClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsSection(
                          text: "7",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "8",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "9",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "*",
                          color: Color(0xfffd5c63),
                          callback: numClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsSection(
                          text: "4",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "5",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "6",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "-",
                          color: Color(0xfffd5c63),
                          callback: numClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsSection(
                          text: "1",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "2",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "3",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "+",
                          color: Color(0xfffd5c63),
                          callback: numClick,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonsSection(
                          text: ".",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "0",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "00",
                          color: Theme.of(context).textTheme.bodyText2.color,
                          callback: numClick,
                        ),
                        ButtonsSection(
                          text: "=",
                          color: Color(0xfffd5c63),
                          callback: calculate,
                        ),
                      ],
                    ),
                  ])),
        ],
      ),
    );
  }
}

class ResultSection extends StatelessWidget {
  ResultSection({
    Key key,
    @required String history,
    @required String expression,
  })  : _history = history,
        _expression = expression,
        super(key: key);

  final String _history;
  final String _expression;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(right: 10.0, bottom: 5.0),
          alignment: Alignment.bottomRight,
          width: double.infinity,
          child: Text(
            _history,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 32.0,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
          alignment: Alignment.bottomRight,
          width: double.infinity,
          child: Text(_expression,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText2.color,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              )),
        ),
      ],
    );
  }
}

class DarkLight extends StatefulWidget {
  DarkLight({
    Key key,
  }) : super(key: key);

  @override
  _DarkLightState createState() => _DarkLightState();
}

class _DarkLightState extends State<DarkLight> {
  bool isDarkThere = true;
  bool l = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(right: 8.0, left: 8.0),
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        height: 50.0,
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).accentColor,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.sun,
                color: isDarkThere ? Colors.white : Colors.black,
                size: 20.0,
              ),
              onPressed: () {
                ThemeProvider themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.getLight();

                setState(() {
                  isDarkThere = !isDarkThere;
                  l = !l;
                });
              }),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.moon,
                color: l ? Colors.white : Colors.black,
                size: 20.0,
              ),
              onPressed: () {
                ThemeProvider themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.getDark();

                setState(() {
                  isDarkThere = !isDarkThere;
                  l = !l;
                });
              }),
        ]),
      ),
    );
  }
}
