import 'package:flutter/material.dart';
import 'package:infoquario/models/forum.dart';

class ForumDetalhesView extends StatefulWidget {
  Forum forum;
  String usuario;
  ForumDetalhesView({Key? key, required this.forum, required this.usuario})
      : super(key: key);

  @override
  _ForumDetalhesViewState createState() => _ForumDetalhesViewState();
}

class _ForumDetalhesViewState extends State<ForumDetalhesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interações "),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
              child: Text(
                "Publicado por " + widget.usuario + ":",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.grey.shade200,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.green,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  widget.forum.descricao,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.green,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
