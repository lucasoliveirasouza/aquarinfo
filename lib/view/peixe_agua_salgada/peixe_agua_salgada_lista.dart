
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/peixe_agua_salgada.dart';
import 'package:infoquario/services/peixe_agua_salgada_service.dart';
import 'package:infoquario/view/peixe_agua_salgada/peixe_agua_salgada_detalhes.dart';

import '../peixe_agua_doce/peixe_agua_doce_detalhes.dart';

class PeixeAguaSalgadaListaView extends StatefulWidget {
  String tipo;
  PeixeAguaSalgadaListaView({Key? key, required this.tipo}) : super(key: key);

  @override
  _PeixeAguaSalgadaListaViewState createState() => _PeixeAguaSalgadaListaViewState();
}

class _PeixeAguaSalgadaListaViewState extends State<PeixeAguaSalgadaListaView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Future<List<PeixeAguaSalgada?>?> futureList =
    PeixeAguaSalgadaService().getAll(widget.tipo);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.tipo),
        ),
        body: Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: FutureBuilder(
                future: futureList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<PeixeAguaSalgada?>?> snapshot) {
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
                                      PeixeAguaSalgadaDetalhesView(peixe:snapshot.data![index]!),
                                ),
                              );
                            },
                          ),
                        );
                      }));
                })));
  }
}
