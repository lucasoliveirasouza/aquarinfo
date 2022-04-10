
import 'package:flutter/material.dart';
import 'package:infoquario/view/crustaceo/crustaceo_lista.dart';
import 'package:infoquario/widget/card_item.dart';

class CrustaceoTipoView extends StatefulWidget {
  String tipoAgua;
  CrustaceoTipoView({Key? key, required this.tipoAgua}) : super(key: key);

  @override
  _CrustaceoTipoViewState createState() => _CrustaceoTipoViewState();
}

class _CrustaceoTipoViewState extends State<CrustaceoTipoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crustáceos de água " + widget.tipoAgua),
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
                image: "crustaceos/caranguejo.png",
                title: "Caranguejo",
                color: Colors.green.shade100,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrustaceoListaView(tipo: "Caranguejo", tipoAgua: widget.tipoAgua),
                    ),
                  );
                },
              ),
              CardItem(
                image: "crustaceos/lagosta.png",
                title: "Lagosta",
                color: Colors.green.shade100,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrustaceoListaView(tipo: "Lagosta", tipoAgua: widget.tipoAgua),
                    ),
                  );
                },
              ),
              CardItem(
                image: "crustaceos/camarao.png",
                title: "Camarão",
                color: Colors.green.shade100,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CrustaceoListaView(tipo: "Camarão", tipoAgua: widget.tipoAgua),
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
