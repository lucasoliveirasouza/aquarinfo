import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/peixe_agua_doce.dart';
import 'package:infoquario/services/peixe_agua_doce_service.dart';

class PeixeAguaDoceDetalhesView extends StatefulWidget {
  PeixeAguaDoce peixe;
  PeixeAguaDoceDetalhesView({Key? key, required this.peixe}) : super(key: key);

  @override
  _PeixeAguaDoceDetalhesViewState createState() =>
      _PeixeAguaDoceDetalhesViewState();
}

class _PeixeAguaDoceDetalhesViewState extends State<PeixeAguaDoceDetalhesView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    Reference teste = storage.ref(widget.peixe.imagem);
    final img = teste.getDownloadURL();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.peixe.nomePopular),
      ),
      body: Container(
        color: Colors.green.shade50,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            FutureBuilder(
                future: img,
                builder:
                    (BuildContext context, AsyncSnapshot<String?> snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      child: Image.network(snapshot.data ?? ""),
                    );
                  } else {
                    return SizedBox(
                      width: 280,
                      height: 280,
                      child: Container(
                        color: Colors.white,
                      ),
                    );
                  }
                }),
            Table(
              children: [
                TableRow(children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    height: 23,
                    child: Text(
                      "Oi:",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    color: Colors.green,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 23,
                    child: Text(
                      "Lucas",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 17, color: Colors.green),
                    ),
                  )
                ]),
              ],
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
