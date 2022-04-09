

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/peixe_agua_doce.dart';

class PeixeAguaDoceDetalhesView extends StatefulWidget {
  PeixeAguaDoce peixe;
  PeixeAguaDoceDetalhesView({Key? key,required this.peixe}) : super(key: key);

  @override
  _PeixeAguaDoceDetalhesViewState createState() => _PeixeAguaDoceDetalhesViewState();
}

class _PeixeAguaDoceDetalhesViewState extends State<PeixeAguaDoceDetalhesView> {
  final FirebaseStorage storage = FirebaseStorage.instance;




  @override
  Widget build(BuildContext context) {
    Reference teste = storage.ref(widget.peixe.imagem);


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.peixe.nomePopular),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text("Nome científico: " + widget.peixe.nomeCientifico),
            ),
            ListTile(
              title: Text("Nome popular: " + widget.peixe.nomePopular),
            ),
            ListTile(
              title: Text("Tipo: " + widget.peixe.tipo),
            ),
            ListTile(
              title: Text("Expectativa de vida: " + widget.peixe.expectativa),
            ),
            ListTile(
              title: Text("Imagem: " + widget.peixe.imagem),
            ),

          ],
        ),
      ),
    );
  }
}
