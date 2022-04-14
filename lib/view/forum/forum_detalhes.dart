

import 'package:flutter/material.dart';
import 'package:infoquario/models/forum.dart';

class ForumDetalhesView extends StatefulWidget {
  Forum forum;
  ForumDetalhesView({Key? key, required this.forum}) : super(key: key);

  @override
  _ForumDetalhesViewState createState() => _ForumDetalhesViewState();
}

class _ForumDetalhesViewState extends State<ForumDetalhesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interação com o fórum"),
      ),
      body: Container(
        padding:  EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              color: Colors.green.shade50,
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
