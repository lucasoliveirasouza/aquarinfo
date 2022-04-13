import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/tartaruga.dart';
import 'package:infoquario/widget/linha_tabela.dart';

class TartarugaDetalhesView extends StatefulWidget {
  Tartaruga tartaruga;
  TartarugaDetalhesView({Key? key, required this.tartaruga}) : super(key: key);

  @override
  _TartarugaDetalhesViewState createState() => _TartarugaDetalhesViewState();
}

class _TartarugaDetalhesViewState extends State<TartarugaDetalhesView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    Reference teste = storage.ref(widget.tartaruga.imagem);
    final img = teste.getDownloadURL();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tartaruga.nomePopular),
      ),
      body: Container(
        color: Colors.green.shade50,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            FutureBuilder(
              future: img,
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
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
              },
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                widget.tartaruga.nomePopular,
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
              valor: widget.tartaruga.nomeCientifico,
              title: "Nome científico:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.classe,
              title: "Classe:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.ordem,
              title: "Ordem:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.familia,
              title: "Familia:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.genero,
              title: "Gênero:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.origem,
              title: "Origem:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.tipo,
              title: "Tipo:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.tamanho,
              title: "Tamanho:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.expectativa,
              title: "Expectativa de vida:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.populacaoMinima,
              title: "População mínima:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.tipoAquario,
              title: "Tipo de aquário:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.volumeMinimo,
              title: "Volume mínimo:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.fachadaMinima,
              title: "Fachada mínima:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.fachadaMinima,
              title: "Fachada mínima:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.phAgua,
              title: "pH da água:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.temperatura,
              title: "Temperatura da água:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.tartaruga.dificuldade,
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
