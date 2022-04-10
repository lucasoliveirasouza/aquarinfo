 import 'package:flutter/material.dart';
import 'package:infoquario/view/peixe_agua_salgada/peixe_agua_salgada_lista.dart';
import 'package:infoquario/widget/card_item.dart';

class PeixeAguaSalgadaView extends StatefulWidget {
   const PeixeAguaSalgadaView({Key? key}) : super(key: key);

   @override
   _PeixeAguaSalgadaViewState createState() => _PeixeAguaSalgadaViewState();
 }

 class _PeixeAguaSalgadaViewState extends State<PeixeAguaSalgadaView> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Peixes de água salgada"),
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
                 image: "agua_salgada/cardume.png",
                 title: "Todos",
                 color: Colors.green.shade100,
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => PeixeAguaSalgadaListaView(tipo: "Todos"),
                     ),
                   );
                 },
               ),
               CardItem(
                 image: "agua_salgada/carnivoros.png",
                 title: "Carnívoros",
                 color: Colors.green.shade100,
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => PeixeAguaSalgadaListaView(tipo: "Carnívoros"),
                     ),
                   );
                 },
               ),
               CardItem(
                 image: "agua_salgada/herbivoros.png",
                 title: "Herbívoros",
                 color: Colors.green.shade100,
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => PeixeAguaSalgadaListaView(tipo: "Herbívoros"),
                     ),
                   );
                 },
               ),
               CardItem(
                 image: "agua_salgada/onivoros.png",
                 title: "Onívoros",
                 color: Colors.green.shade100,
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => PeixeAguaSalgadaListaView(tipo: "Onívoros"),
                     ),
                   );
                 },
               ),

               CardItem(
                 image: "agua_salgada/planctofagos.png",
                 title: "Planctógafos",
                 color: Colors.green.shade100,
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => PeixeAguaSalgadaListaView(tipo: "Planctógafos"),
                     ),
                   );
                 },
               ),

               CardItem(
                 image: "agua_salgada/detritivoros.png",
                 title: "Detritívoros",
                 color: Colors.green.shade100,
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => PeixeAguaSalgadaListaView(tipo: "Detritívoros"),
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
