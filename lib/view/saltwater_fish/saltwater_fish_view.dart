 import 'package:flutter/material.dart';

class SaltwaterFishView extends StatefulWidget {
   const SaltwaterFishView({Key? key}) : super(key: key);

   @override
   _SaltwaterFishViewState createState() => _SaltwaterFishViewState();
 }

 class _SaltwaterFishViewState extends State<SaltwaterFishView> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text("Peixes de água salgada"),
       ),
     );
   }
 }
