
import 'package:flutter/material.dart';

class AquarioListaView extends StatefulWidget {
  String tipo;
  AquarioListaView({Key? key, required this.tipo}) : super(key: key);

  @override
  _AquarioListaViewState createState() => _AquarioListaViewState();
}

class _AquarioListaViewState extends State<AquarioListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipo),
      ),
    );
  }
}
