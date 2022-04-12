

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/tartaruga.dart';
import 'package:infoquario/services/tartaruga_service.dart';
import 'package:infoquario/view/tartaruga/tartaruga_detalhes.dart';

class TartarugaListaView extends StatefulWidget {
  String tipoAgua;
  TartarugaListaView({Key? key, required this.tipoAgua}) : super(key: key);

  @override
  _TartarugaListaViewState createState() => _TartarugaListaViewState();
}

class _TartarugaListaViewState extends State<TartarugaListaView> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Future<List<Tartaruga?>?> futureList =
    TartarugaService().getAll(widget.tipoAgua);
    return Scaffold(
        appBar: AppBar(
          title: Text("Tartaruga de água " + widget.tipoAgua),
        ),
        body: Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: FutureBuilder(
                future: futureList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Tartaruga?>?> snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        Reference imagens =
                        storage.ref(snapshot.data![index]!.imagem);
                        final img = imagens.getDownloadURL();

                        return Card(
                          child: ListTile(
                            leading: FutureBuilder(
                                future: img,
                                builder: (BuildContext context,
                                    AsyncSnapshot<String?> snapshot) {
                                  if (snapshot.hasData) {
                                    return SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.network(snapshot.data ?? ""),
                                    );
                                  } else {
                                    return SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Container(
                                        color: Colors.white,
                                      ),
                                    );
                                  }
                                }),
                            title: Text(snapshot.data![index]!.nomePopular),
                            subtitle:
                            Text(snapshot.data![index]!.nomeCientifico),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TartarugaDetalhesView(tartaruga:snapshot.data![index]!),
                                ),
                              );
                            },
                          ),
                        );
                      }));
                })));
  }
}
