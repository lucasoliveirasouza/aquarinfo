import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/crustaceo.dart';
import 'package:infoquario/widget/linha_tabela.dart';

class CrustaceoDetalhesView extends StatefulWidget {
  Crustaceo crustaceo;
  CrustaceoDetalhesView({Key? key, required this.crustaceo}) : super(key: key);

  @override
  _CrustaceoDetalhesViewState createState() => _CrustaceoDetalhesViewState();
}

class _CrustaceoDetalhesViewState extends State<CrustaceoDetalhesView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    Reference teste = storage.ref(widget.crustaceo.imagem);
    final img = teste.getDownloadURL();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.crustaceo.nomePopular),
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
                widget.crustaceo.nomePopular,
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
              valor: widget.crustaceo.nomeCientifico,
              title: "Nome científico:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.classe,
              title: "Classe:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.ordem,
              title: "Ordem:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.familia,
              title: "Familia:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.genero,
              title: "Gênero:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.origem,
              title: "Origem:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.tipo,
              title: "Tipo:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.tipoAgua,
              title: "Tipo de habitat:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.tamanho,
              title: "Tamanho:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.expectativa,
              title: "Expectativa de vida:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.populacaoMinima,
              title: "População mínima:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.tipoAquario,
              title: "Tipo de aquário:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.volumeMinimo,
              title: "Volume mínimo:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.fachadaMinima,
              title: "Fachada mínima:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.phAgua,
              title: "pH da água:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.temperatura,
              title: "Temperatura da água:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.crustaceo.dificuldade,
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
