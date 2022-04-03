
import 'package:flutter/material.dart';

class AquariumView extends StatefulWidget {
  const AquariumView({Key? key}) : super(key: key);

  @override
  _AquariumViewState createState() => _AquariumViewState();
}

class _AquariumViewState extends State<AquariumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aquários"),
      ),
    );
  }
}
