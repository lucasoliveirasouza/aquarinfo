import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/widget/form_field.dart';

class ForumCadastroView extends StatefulWidget {
  const ForumCadastroView({Key? key}) : super(key: key);

  @override
  State<ForumCadastroView> createState() => _ForumCadastroViewState();
}

class _ForumCadastroViewState extends State<ForumCadastroView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  final duvidas = TextEditingController();
  final assunto = TextEditingController();
  String categoria = 'Selecione a categoria...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastre aqui sua dúvida"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: ListView(
            children: [
              Container(
                child: DropdownButtonFormField<String>(
                  value: categoria,
                  icon: Icon(null),
                  elevation: 15,
                  decoration: InputDecoration(labelText: 'Categoria'),
                  onChanged: (String? newValue) {
                    setState(() {
                      categoria = newValue!;
                    });
                  },
                  items: <String>[
                    'Selecione a categoria...',
                    'Peixes de água doce',
                    'Peixes de água salgada',
                    'Crustáceos',
                    'Tartarugas',
                    'Plantas',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: assunto,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Assunto",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      new Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                minLines:
                    5, // any number you need (It works as the rows for the textarea)
                maxLines: null,
                controller: duvidas,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Dúvidas/Sugestões/Dicas",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      new Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  child: Text("Cadastrar"),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
