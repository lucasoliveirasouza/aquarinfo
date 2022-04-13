
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/planta.dart';
import 'package:infoquario/widget/linha_tabela.dart';

class PlantaDetalhesView extends StatefulWidget {
  Planta planta;
  PlantaDetalhesView({Key? key, required this.planta}) : super(key: key);

  @override
  _PlantaDetalhesViewState createState() => _PlantaDetalhesViewState();
}

class _PlantaDetalhesViewState extends State<PlantaDetalhesView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {

    Reference image = storage.ref(widget.planta.imagem);
    final img = image.getDownloadURL();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.planta.nomePopular),
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
                widget.planta.nomePopular,
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
              valor: widget.planta.nomeCientifico,
              title: "Nome científico:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.classe,
              title: "Classe:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.ordem,
              title: "Ordem:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.familia,
              title: "Familia:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.genero,
              title: "Gênero:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.origem,
              title: "Origem:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.tipo,
              title: "Tipo:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.tamanho,
              title: "Tamanho:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.dificuldade,
              title: "Dificuldade:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.crescimento,
              title: "Crescimento:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.iluminacao,
              title: "Iluminação:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.substrato,
              title: "Substrato:",
            ),
            SizedBox(
              height: 3,
            ),

            LinhaTabela(
              valor: widget.planta.phAgua,
              title: "pH da água:",
            ),
            SizedBox(
              height: 3,
            ),
            LinhaTabela(
              valor: widget.planta.temperatura,
              title: "Temperatura da água:",
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
