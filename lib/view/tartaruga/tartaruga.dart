
import 'package:flutter/material.dart';
import 'package:infoquario/view/tartaruga/tartaruga_lista.dart';
import 'package:infoquario/widget/card_item.dart';

class TartarugaView extends StatefulWidget {
  const TartarugaView({Key? key}) : super(key: key);

  @override
  _TartarugaViewState createState() => _TartarugaViewState();
}

class _TartarugaViewState extends State<TartarugaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tartarugas"),
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
                image: "tartarugas/tartaruga_doce.png",
                title: "Água doce",
                color: Colors.green.shade100,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TartarugaListaView(tipoAgua: "doce"),
                    ),
                  );
                },
              ),
              CardItem(
                image: "tartarugas/tartaruga_marinha.png",
                title: "Água salgada",
                color: Colors.green.shade100,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TartarugaListaView(tipoAgua: "salgada"),
                    ),
                  );
                },
              ),

            ],
          )
      ),
    );
  }
}
