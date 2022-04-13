import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/models/planta.dart';
import 'package:infoquario/services/planta_service.dart';
import 'package:infoquario/view/plantas/planta_detalhes.dart';

class PlantaListaView extends StatefulWidget {
  String tipo;
  PlantaListaView({Key? key, required this.tipo}) : super(key: key);

  @override
  _PlantaListaViewState createState() => _PlantaListaViewState();
}

class _PlantaListaViewState extends State<PlantaListaView> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    Future<List<Planta?>?> futureList =
    PlantaService().getAll(widget.tipo);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipo),
      ),
      body: Container(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: FutureBuilder(
              future: futureList,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Planta?>?> snapshot) {
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
                                builder: (context) => PlantaDetalhesView(
                                    planta: snapshot.data![index]!),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    )
                );
              }
          )
      )
    );
  }
}
