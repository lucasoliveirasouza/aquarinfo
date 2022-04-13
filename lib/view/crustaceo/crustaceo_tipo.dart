import 'package:flutter/material.dart';
import 'package:infoquario/view/crustaceo/crustaceo_lista.dart';
import 'package:infoquario/widget/card_item.dart';

class CrustaceoTipoView extends StatefulWidget {
  CrustaceoTipoView({Key? key}) : super(key: key);

  @override
  _CrustaceoTipoViewState createState() => _CrustaceoTipoViewState();
}

class _CrustaceoTipoViewState extends State<CrustaceoTipoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crustáceos"),
      ),
      body: Container(
          child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          CardItem(
            image: "crustaceos/todos.png",
            title: "Todos",
            color: Colors.green.shade100,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CrustaceoListaView(
                      tipo: "Todos"),
                ),
              );
            },
          ),
          CardItem(
            image: "crustaceos/caranguejo.png",
            title: "Caranguejo",
            color: Colors.green.shade100,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CrustaceoListaView(
                      tipo: "Caranguejo"),
                ),
              );
            },
          ),
          CardItem(
            image: "crustaceos/camarao.png",
            title: "Camarão",
            color: Colors.green.shade100,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CrustaceoListaView(
                      tipo: "Camarão"),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
