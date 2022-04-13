
import 'package:flutter/material.dart';
import 'package:infoquario/models/planta.dart';

class PlantaDetalhesView extends StatefulWidget {
  Planta planta;
  PlantaDetalhesView({Key? key, required this.planta}) : super(key: key);

  @override
  _PlantaDetalhesViewState createState() => _PlantaDetalhesViewState();
}

class _PlantaDetalhesViewState extends State<PlantaDetalhesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("oi"),
      ),
    );
  }
}
