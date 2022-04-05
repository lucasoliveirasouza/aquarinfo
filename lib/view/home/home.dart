
import 'package:flutter/material.dart';
import 'package:infoquario/view/menu/menu_view.dart';
import 'package:infoquario/view/peixe_agua_doce/peixe_agua_doce.dart';

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
        body: PeixeAguaDoceView(),
    );
  }
}
