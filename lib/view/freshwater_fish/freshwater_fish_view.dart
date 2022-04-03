
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infoquario/view/freshwater_fish/filter/freshwater_fish_filter_view.dart';

import 'package:infoquario/widget/card_item.dart';

class FreshwaterFishView extends StatefulWidget {
  const FreshwaterFishView({Key? key}) : super(key: key);

  @override
  _FreshwaterFishViewState createState() => _FreshwaterFishViewState();
}

class _FreshwaterFishViewState extends State<FreshwaterFishView> {
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
              image: "shoal.png",
              title: "Todos",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreshwaterFishFilterView(tipo: "Todos"),
                  ),
                );
              },
            ),
            CardItem(
              image: "piranha.png",
              title: "Carnívoros",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreshwaterFishFilterView(tipo: "Carnívoros"),
                  ),
                );
              },
            ),
            CardItem(
              image: "guppy.png",
              title: "Herbívoros",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreshwaterFishFilterView(tipo: "Herbívoros"),
                  ),
                );
              },
            ),
            CardItem(
              image: "tetraneon.png",
              title: "Onívoros",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreshwaterFishFilterView(tipo: "Onívoros"),
                  ),
                );
              },
            ),

            CardItem(
              image: "carpa.png",
              title: "Planctógafos",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreshwaterFishFilterView(tipo: "Planctógafos"),
                  ),
                );
              },
            ),

            CardItem(
              image: "substituir.png",
              title: "Detritívoros",
              color: Colors.green.shade100,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FreshwaterFishFilterView(tipo: "Detritívoros"),
                  ),
                );
              },
            ),

          ],
        )
      )
    );
  }
}


