import 'package:flutter/material.dart';
import 'package:infoquario/view/plantas/planta_lista.dart';
import 'package:infoquario/widget/card_item.dart';

class PlantaView extends StatefulWidget {
  const PlantaView({Key? key}) : super(key: key);

  @override
  _PlantaViewState createState() => _PlantaViewState();
}

class _PlantaViewState extends State<PlantaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plantas"),
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
            image: "plantas/alga.png",
            title: "Plantas",
            color: Colors.green.shade100,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantaListaView(tipo: "Plantas"),
                ),
              );
            },
          ),
          CardItem(
            image: "plantas/alga.png",
            title: "Corais",
            color: Colors.green.shade100,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantaListaView(tipo: "Corais"),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
