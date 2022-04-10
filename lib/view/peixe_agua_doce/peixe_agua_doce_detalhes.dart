

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
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [

            SizedBox(
              height: 250,
              width: 250,
              child: Image.network("https://firebasestorage.googleapis.com/v0/b/infoquario.appspot.com/o/images%2Fimg-2022-04-10%2012%3A00%3A24.590132.png?alt=media&token=ac0a97fd-168f-4797-8f8c-3edb40e9a3f9"),
            ),
            SizedBox(
              height: 5,
            ),

            Text(
              "Nome popular: " + widget.peixe.nomePopular,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "Nome científico: " + widget.peixe.nomeCientifico,
                style: TextStyle(
                  fontSize: 17,
                ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Classe: " + widget.peixe.classe,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Ordem: " + widget.peixe.ordem,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Familia: " + widget.peixe.familia,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Gênero: " + widget.peixe.genero,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "Tipo: " + widget.peixe.tipo,
                style: TextStyle(
                  fontSize: 17,
                ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Tamanho: " + widget.peixe.tamanho,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                "Expectativa de vida: " + widget.peixe.expectativa,
                style: TextStyle(
                  fontSize: 17,
                ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "População mínima: " + widget.peixe.populacaoMinima,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Tipo de aquário: " + widget.peixe.tipoAquario,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Text(
              "Volume mínimo: " + widget.peixe.volumeMinimo,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Text(
              "Fachada mínima: " + widget.peixe.fachadaMinima,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Text(
              "pH da água: " + widget.peixe.phAgua,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Temperatura da água: " + widget.peixe.temperatura,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),

            Text(
              "Dificuldade de criação: " + widget.peixe.dificuldade,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
