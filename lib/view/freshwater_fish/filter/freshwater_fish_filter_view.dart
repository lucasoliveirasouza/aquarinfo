

import 'package:flutter/material.dart';

class FreshwaterFishFilterView extends StatefulWidget {
  String tipo;
  FreshwaterFishFilterView({Key? key,required this.tipo}) : super(key: key);

  @override
  _FreshwaterFishFilterViewState createState() => _FreshwaterFishFilterViewState();
}

class _FreshwaterFishFilterViewState extends State<FreshwaterFishFilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tipo),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                children: [

                  SizedBox(
                    width: 110,
                    height: 110,
                    child: Image.asset("assets/fishlogin.png"),
                  ),
                  ListTile(
                    title: Text(
                      'Peixe',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
        )
      )
    );
  }
}
