

import 'package:flutter/material.dart';
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

  Future<List<PeixeAguaDoce?>?> futureList = PeixeAguaDoceService().getAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipo),
      ),
      body:Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: FutureBuilder(

          future: futureList,
          builder:
              (BuildContext context, AsyncSnapshot<List<PeixeAguaDoce?>?> snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                shrinkWrap: true,
                itemBuilder: ((context, index) {

                  return Card(
                    child: ListTile(
                      title: Text( snapshot.data![index]!.nomeCientifico),
                      subtitle: Text( snapshot.data![index]!.tipo),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PeixeAguaDoceDetalhesView(peixe: snapshot.data![index]!),
                          ),
                        );
                      },
                    ),

                  );
                }));
          },
        ),
      ),


      /*Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                children: [

                  SizedBox(

                    child: Image.asset("assets/images/matogrosso.png"),
                  ),
                  Container(
                    color: Colors.green.shade100,
                    child: ListTile(
                      title: Text(
                        'Mato Grosso ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]
        )
      )*/
    );
  }
}
