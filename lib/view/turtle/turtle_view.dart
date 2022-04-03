
import 'package:flutter/material.dart';

class TurtleView extends StatefulWidget {
  const TurtleView({Key? key}) : super(key: key);

  @override
  _TurtleViewState createState() => _TurtleViewState();
}

class _TurtleViewState extends State<TurtleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tartarugas"),
      ),
    );
  }
}
