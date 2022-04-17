import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class LicencasView extends StatefulWidget {
  const LicencasView({Key? key}) : super(key: key);

  @override
  _LicencasViewState createState() => _LicencasViewState();
}

class _LicencasViewState extends State<LicencasView> {

  void openBrowserTab() async{
    const url = 'https://www.flaticon.com/br/';
    if (await canLaunch(url)) {
      await launch('$url');
      print("É possível abrir a URL");
    } else {
      print("Não è possível abrir a URL");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Licença"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        color: Colors.green.shade100,
        child: ListView(
          children: [
            TextButton(
                onPressed: (){
                  openBrowserTab;
                },
                child: Text(
                    "Icones utilizados",
                    style: TextStyle(
                      fontSize: 18
                    ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
