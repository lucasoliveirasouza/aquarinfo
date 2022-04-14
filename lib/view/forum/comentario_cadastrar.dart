import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/services/comentario_service.dart';

class CometarioCadastrarView extends StatefulWidget {
  const CometarioCadastrarView({Key? key}) : super(key: key);

  @override
  State<CometarioCadastrarView> createState() => _CometarioCadastrarViewState();
}

class _CometarioCadastrarViewState extends State<CometarioCadastrarView> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responder"),
      ),
      body: Container(
        child: ListView(
          children: [
            TextFormField(
              minLines:
                  5, // any number you need (It works as the rows for the textarea)
              maxLines: null,
              controller: descricao,
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
                onPressed: () {
                  DateTime now = DateTime.now();

                  String hora =
                      "Às ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} de ${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(ComentarioService()
                          .cadastrarComentario(
                            descricao.text,
                            widget.usuario,
                            hora,
                            widget.idForum,
                          )
                          .toString())));
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
