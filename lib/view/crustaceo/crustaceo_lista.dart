import 'package:flutter/material.dart';

class CrustaceoListaView extends StatefulWidget {
  String tipo, tipoAgua;
  CrustaceoListaView({Key? key, required this.tipo, required this.tipoAgua})
      : super(key: key);

  @override
  _CrustaceoListaViewState createState() => _CrustaceoListaViewState();
}

class _CrustaceoListaViewState extends State<CrustaceoListaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipo + " de " + widget.tipoAgua),
      ),
    );
  }
}
