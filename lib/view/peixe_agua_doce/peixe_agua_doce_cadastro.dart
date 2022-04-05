

import 'package:flutter/material.dart';
import 'package:infoquario/services/peixe_agua_doce_service.dart';

class PeixeAguaDoceCadastroView extends StatefulWidget {
  const PeixeAguaDoceCadastroView({Key? key}) : super(key: key);

  @override
  _PeixeAguaDoceCadastroViewState createState() => _PeixeAguaDoceCadastroViewState();
}

class _PeixeAguaDoceCadastroViewState extends State<PeixeAguaDoceCadastroView> {
  final nomeCientifico = TextEditingController();
  final tipo = TextEditingController();
  final nomePopular = TextEditingController();
  final expectativa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextFormField(
              controller: nomeCientifico,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome científico",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: tipo,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Tipo",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nomePopular,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome popular",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: expectativa,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Expectativa de vida",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 50, left: 50),
              child: ElevatedButton(
                child: Text("Cadastrar"),
                onPressed: () {
                  PeixeAguaDoceService().registerFreshwater(nomeCientifico.text, tipo.text,nomePopular.text, expectativa.text);
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
