import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/forum.dart';
import 'package:infoquario/services/forum_service.dart';
import 'package:infoquario/view/forum/forum_cadastrar.dart';
import 'package:infoquario/view/forum/forum_detalhes.dart';

class ForumView extends StatefulWidget {
  String usuario;
  ForumView({Key? key, required this.usuario}) : super(key: key);

  @override
  State<ForumView> createState() => _ForumViewState();
}

class _ForumViewState extends State<ForumView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    Future<List<Forum?>?> futureList = ForumService().getAll();
    return Scaffold(
      appBar: AppBar(
        title: Text("Fórum"),
      ),
      body: Container(
          padding: EdgeInsets.only(right: 15, left: 15,top: 10),
          child: FutureBuilder(
              future: futureList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Forum?>?> snapshot) {
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Container(


                        child: Card(
                          color: Colors.green.shade50,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(snapshot.data![index]!.usuario),
                            subtitle: Text(snapshot.data![index]!.descricao),
                            leading: Icon(
                              Icons.account_circle,
                              size: 50,
                              color: Colors.green,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForumDetalhesView(
                                      forum: snapshot.data![index]!,
                                      usuario: widget.usuario,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                    )
                );
              }
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForumCadastroView(usuario: widget.usuario),
            ),
          );
        },
      ),
    );
  }
}
