import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/crustaceo.dart';
import 'package:infoquario/services/crustaceos_service.dart';
import 'package:infoquario/view/crustaceo/crustaceo_detalhes.dart';

class CrustaceoListaView extends StatefulWidget {
  String tipo, tipoAgua;
  CrustaceoListaView({Key? key, required this.tipo, required this.tipoAgua})
      : super(key: key);

  @override
  _CrustaceoListaViewState createState() => _CrustaceoListaViewState();
}

class _CrustaceoListaViewState extends State<CrustaceoListaView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Future<List<Crustaceo?>?> futureList =
        CrustaceoService().getAll(widget.tipo, widget.tipoAgua);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.tipo + " de " + widget.tipoAgua),
        ),
        body: Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: FutureBuilder(
                future: futureList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Crustaceo?>?> snapshot) {
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
                                  builder: (context) => CrustaceoDetalhesView(
                                      crustaceo: snapshot.data![index]!),
                                ),
                              );
                            },
                          ),
                        );
                      }));
                })));
  }
}
