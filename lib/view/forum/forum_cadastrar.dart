import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForumCadastroView extends StatefulWidget {
  const ForumCadastroView({Key? key}) : super(key: key);

  @override
  State<ForumCadastroView> createState() => _ForumCadastroViewState();
}

class _ForumCadastroViewState extends State<ForumCadastroView> {
  String categoria = 'Selecione a categoria...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastre aqui sua dúvida"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
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
                height: 15,
              )
            ],
          ),
        ));
  }
}
