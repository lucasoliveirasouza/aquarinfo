

import 'package:flutter/material.dart';

class TartarugaListaView extends StatefulWidget {
  String tipoAgua;
  TartarugaListaView({Key? key, required this.tipoAgua}) : super(key: key);

  @override
  _TartarugaListaViewState createState() => _TartarugaListaViewState();
}

class _TartarugaListaViewState extends State<TartarugaListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tartarugas de água " + widget.tipoAgua),
      ),
    );
  }
}
