
import 'package:flutter/material.dart';

class AquarioView extends StatefulWidget {
  const AquarioView({Key? key}) : super(key: key);

  @override
  _AquarioViewState createState() => _AquarioViewState();
}

class _AquarioViewState extends State<AquarioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aquários"),
      ),
    );
  }
}
