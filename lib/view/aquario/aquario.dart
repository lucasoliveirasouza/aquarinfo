
import 'package:flutter/material.dart';
import 'package:infoquario/view/aquario/aquario_lista.dart';
import 'package:infoquario/widget/card_item.dart';

class AquarioView extends StatefulWidget {
  const AquarioView({Key? key}) : super(key: key);

  @override
  _AquarioViewState createState() => _AquarioViewState();
}

class _AquarioViewState extends State<AquarioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aquários"),
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
                image: "aquarios/aquario.png",
                title: "Aquários",
                color: Colors.green.shade100,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AquarioListaView(tipo: "Aquários"),
                    ),
                  );
                },
              ),
              CardItem(
                image: "aquarios/alga.png",
                title: "Plantas",
                color: Colors.green.shade100,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AquarioListaView(tipo: "Plantas para aquário"),
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
