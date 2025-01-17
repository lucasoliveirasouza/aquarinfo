import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/peixe.dart';
import 'package:infoquario/widget/linha_tabela.dart';

class PeixeAguaDoceDetalhesView extends StatefulWidget {
  Peixe peixe;
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
                      child: Container(
                        color: Colors.green.shade50,
                      ),
                    );
                  }
                }),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                widget.peixe.nomePopular,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LinhaTabela(
              valor: widget.peixe.nomeCientifico,
              title: "Nome científico:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.classe,
              title: "Classe:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.ordem,
              title: "Ordem:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.familia,
              title: "Familia:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.genero,
              title: "Gênero:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.origem,
              title: "Origem:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.tipoAgua,
              title: "Tipo água:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.tipo,
              title: "Tipo:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.tamanho,
              title: "Tamanho:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.expectativa,
              title: "Expectativa de vida:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.populacaoMinima,
              title: "População mínima:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.tipoAquario,
              title: "Tipo de aquário:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.volumeMinimo,
              title: "Volume mínimo:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.fachadaMinima,
              title: "Fachada mínima:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.phAgua,
              title: "pH da água:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.temperatura,
              title: "Temperatura da água:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.peixe.dificuldade,
              title: "Dificuldade de criação:",
            ),
            SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
