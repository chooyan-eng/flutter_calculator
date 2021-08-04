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

class _MyHomePageState extends State<MyHomePage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: 'AC',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '+/-',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '%',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '/',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '7',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '8',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '9',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '*',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '4',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '5',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '6',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '-',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '1',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '2',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '3',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '+',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
              ],
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '0',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '00',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '.',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: Panel(
                    label: '=',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 1),
              ],
            ),
          ],
        ),
      ),
    );
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
