import 'package:flutter/material.dart';

class PlantaListaView extends StatefulWidget {
  String tipo;
  PlantaListaView({Key? key, required this.tipo}) : super(key: key);

  @override
  _PlantaListaViewState createState() => _PlantaListaViewState();
}

class _PlantaListaViewState extends State<PlantaListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipo),
      ),
    );
  }
}
