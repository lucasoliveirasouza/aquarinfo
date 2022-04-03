
import 'package:flutter/material.dart';

class CrustaceanView extends StatefulWidget {
  const CrustaceanView({Key? key}) : super(key: key);

  @override
  _CrustaceanViewState createState() => _CrustaceanViewState();
}

class _CrustaceanViewState extends State<CrustaceanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crustáceos"),
      ),
    );
  }
}
