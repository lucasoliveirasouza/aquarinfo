

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
    );
  }
}
