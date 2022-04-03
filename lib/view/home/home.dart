
import 'package:flutter/material.dart';
import 'package:infoquario/view/freshwater_fish/freshwater_fish_view.dart';
import 'package:infoquario/view/menu/menu_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuView(),
        appBar: AppBar(
          title: Text("Peixes de água doce"),
        ),
        body: FreshwaterFishView(),
    );
  }
}
