import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum Operator { plus, minus, time, divide }

class _MyHomePageState extends State<MyHomePage> {
  final _panelActions = <String, VoidCallback>{};
  final _operatorStrings = <Operator, String>{
    Operator.plus: '+',
    Operator.minus: '-',
    Operator.time: '*',
    Operator.divide: '/',
  };

  num? _leftOperand;
  num? _rightOperand;
  Operator? _operator;
  num? _result;

  String get _statement {
    return [
      _leftOperand?.toString() ?? '',
      _operatorStrings[_operator] ?? '',
      _rightOperand?.toString() ?? '',
    ].where((element) => element != '').join(' ');
  }

  @override
  void initState() {
    _panelActions.addAll({
      '1': () => _inputNumber(1),
      '2': () => _inputNumber(2),
      '3': () => _inputNumber(3),
      '4': () => _inputNumber(4),
      '5': () => _inputNumber(5),
      '6': () => _inputNumber(6),
      '7': () => _inputNumber(7),
      '8': () => _inputNumber(8),
      '9': () => _inputNumber(9),
      '0': () => _inputZero(),
      '00': () => _inputZero(digits: 2),
      'AC': _clear,
      '+/-': _toggleSign,
      '%': _percentize,
      '.': _inputDot,
      '+': () => _inputOperator(Operator.plus),
      '-': () => _inputOperator(Operator.minus),
      '*': () => _inputOperator(Operator.time),
      '/': () => _inputOperator(Operator.divide),
      '=': _calculate,
    });
    super.initState();
  }

  void _inputNumber(int number) {
    setState(() {
      if (_operator == null) {
        _leftOperand = (_leftOperand ?? 0) * 10 + number;
      } else {
        _rightOperand = (_rightOperand ?? 0) * 10 + number;
      }
    });
  }

  void _inputZero({int digits = 1}) {}

  void _clear() {
    setState(() {
      _leftOperand = null;
      _operator = null;
      _rightOperand = null;
      _result = null;
    });
  }

  void _toggleSign() {}

  void _percentize() {}

  void _inputDot() {}

  void _inputOperator(Operator opr) {
    setState(() {
      _operator = opr;
    });
  }

  void _calculate() {
    setState(() {
      switch (_operator!) {
        case Operator.plus:
          _result = _leftOperand! + _rightOperand!;
          break;
        case Operator.minus:
          _result = _leftOperand! - _rightOperand!;
          break;
        case Operator.time:
          _result = _leftOperand! * _rightOperand!;
          break;
        case Operator.divide:
          _result = _leftOperand! / _rightOperand!;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.black12,
                margin: const EdgeInsets.all(1),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _statement,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      _result?.toString() ?? '',
                      style: const TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                ..._buildPanelsRow(['AC', '+/-', '%', '/'])
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                ..._buildPanelsRow(['7', '8', '9', '*'])
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                ..._buildPanelsRow(['4', '5', '6', '-'])
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                ..._buildPanelsRow(['1', '2', '3', '+'])
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                ..._buildPanelsRow(['0', '00', '.', '='])
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPanelsRow(List<String> labels) {
    return labels
        .map((label) => Expanded(
              child: Panel(
                label: label,
                onTap: _panelActions[label]!,
              ),
            ))
        .expand((widget) => [widget, const SizedBox(width: 1)])
        .toList();
  }
}

class Panel extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const Panel({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  var _isPressed = false;

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _togglePressed();
        widget.onTap();
      },
      onTapUp: (_) => _togglePressed(),
      child: AspectRatio(
        aspectRatio: 1, // fix size as a square
        child: Container(
          color: _isPressed ? Colors.red.shade300 : Colors.black45,
          child: Center(
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
