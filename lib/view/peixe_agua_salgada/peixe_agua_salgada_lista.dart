
import 'package:flutter/material.dart';

class PeixeAguaSalgadaListaView extends StatefulWidget {
  String tipo;
  PeixeAguaSalgadaListaView({Key? key,required this.tipo}) : super(key: key);

  @override
  _PeixeAguaSalgadaListaViewState createState() => _PeixeAguaSalgadaListaViewState();
}

class _PeixeAguaSalgadaListaViewState extends State<PeixeAguaSalgadaListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipo),
      ),
    );
  }
}
