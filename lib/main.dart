import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:powers/powers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Number Shapes',
      home: Content(),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final TextEditingController txtController = TextEditingController();
  String displayedText;
  int num;

  @override
  void dispose() {
    txtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Number Shapes')),
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: void_checks
        onPressed: () {
          num = int.parse(txtController.text);
          if (num.isSquare && num.isCube) {
            displayedText = 'Number $num is both SQUARE and TRIANGULAR.';
          } else if (num.isSquare) {
            displayedText = 'Number $num is SQUARE.';
          } else if (num.isCube) {
            displayedText = 'Number $num is TRIANGULAR.';
          } else {
            displayedText = 'Number $num is neither SQUARE or TRIANGULAR.';
          }
          txtController.clear();
          return showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('$num'),
                  content: Text(displayedText),
                );
              });
        },
        child: const Icon(Icons.check),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Please input a number to see if it is square or triangle.',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              controller: txtController,
            ),
          ),
        ],
      ),
    );
  }
}
