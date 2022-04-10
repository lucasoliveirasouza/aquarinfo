

import 'package:flutter/material.dart';

class TartarugaLista extends StatefulWidget {
  String tipoAgua;
  TartarugaLista({Key? key, required this.tipoAgua}) : super(key: key);

  @override
  _TartarugaListaState createState() => _TartarugaListaState();
}

class _TartarugaListaState extends State<TartarugaLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tartarugas de água " + widget.tipoAgua),
      ),
    );
  }
}
