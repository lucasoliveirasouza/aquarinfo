

import 'package:flutter/material.dart';

class TartarugaListaView extends StatefulWidget {

  TartarugaListaView({Key? key}) : super(key: key);

  @override
  _TartarugaListaViewState createState() => _TartarugaListaViewState();
}

class _TartarugaListaViewState extends State<TartarugaListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tartarugas"),
      ),
    );
  }
}
