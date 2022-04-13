
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infoquario/view/peixe_agua_doce/peixe_agua_doce_cadastro.dart';
import 'package:infoquario/view/peixe_agua_doce/peixe_agua_doce_lista.dart';


import 'package:infoquario/widget/card_item.dart';

class PeixeAguaDoceView extends StatefulWidget {
  const PeixeAguaDoceView({Key? key}) : super(key: key);

  @override
  _PeixeAguaDoceViewState createState() => _PeixeAguaDoceViewState();
}

class _PeixeAguaDoceViewState extends State<PeixeAguaDoceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            CardItem(
              image: "agua_doce/shoal.png",
              title: "Todos",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeixeAguaDoceListaView(tipo: "Todos"),
                  ),
                );
              },
            ),
            CardItem(
              image: "agua_doce/piranha.png",
              title: "Carnívoros",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeixeAguaDoceListaView(tipo: "Carnívoros"),
                  ),
                );
              },
            ),
            CardItem(
              image: "agua_doce/guppy.png",
              title: "Herbívoros",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeixeAguaDoceListaView(tipo: "Herbívoros"),
                  ),
                );
              },
            ),
            CardItem(
              image: "agua_doce/tetraneon.png",
              title: "Onívoros",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeixeAguaDoceListaView(tipo: "Onívoros"),
                  ),
                );
              },
            ),

            CardItem(
              image: "agua_doce/carpa.png",
              title: "Planctógafos",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeixeAguaDoceListaView(tipo: "Planctógafos"),
                  ),
                );
              },
            ),

            CardItem(
              image: "agua_doce/carpadetritos.png",
              title: "Detritívoros",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PeixeAguaDoceListaView(tipo: "Detritívoros"),
                  ),
                );
              },
            ),

          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PeixeAguaDoceCadastroView()
            ),
          );
        },
      ),
    );
  }
}


