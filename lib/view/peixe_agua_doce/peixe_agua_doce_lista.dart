

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infoquario/models/peixe_agua_doce.dart';
import 'package:infoquario/services/peixe_agua_doce_service.dart';
import 'package:infoquario/view/peixe_agua_doce/peixe_agua_doce_detalhes.dart';

class PeixeAguaDoceListaView extends StatefulWidget {
  String tipo;
  PeixeAguaDoceListaView({Key? key,required this.tipo}) : super(key: key);

  @override
  _PeixeAguaDoceListaViewState createState() => _PeixeAguaDoceListaViewState();
}

class _PeixeAguaDoceListaViewState extends State<PeixeAguaDoceListaView> {

  @override
  Widget build(BuildContext context) {
    Future<List<PeixeAguaDoce?>?> futureList = PeixeAguaDoceService().getAll(widget.tipo);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.tipo),
        ),
        body: Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: FutureBuilder(

                future: futureList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<PeixeAguaDoce?>?> snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(snapshot.data![index]!.nomeCientifico),
                            subtitle: Text(snapshot.data![index]!.tipo),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PeixeAguaDoceDetalhesView(
                                          peixe: snapshot.data![index]!),
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