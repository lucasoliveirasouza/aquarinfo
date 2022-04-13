import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/services/auth_service.dart';
import 'package:infoquario/view/about/about_view.dart';
import 'package:infoquario/view/crustaceo/crustaceo_tipo.dart';
import 'package:infoquario/view/peixe_agua_salgada/peixe_agua_salgada.dart';
import 'package:infoquario/view/plantas/planta.dart';
import 'package:infoquario/view/tartaruga/tartaruga_lista.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
              height: 100,
              child: DrawerHeader(
                child: ListTile(
                  title: Text(
                    auth.currentUser!.email.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage('assets/fishlogin.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              )),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/fish.png'),
            ),
            title: Text('Peixes de água doce'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/shark.png'),
            ),
            title: Text('Peixes de água salgada'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PeixeAguaSalgadaView(),
                ),
              )
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/crustacean.png'),
            ),
            title: Text('Crustáceos'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CrustaceoTipoView(),
                ),
              )
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/aquarium.png'),
            ),
            title: Text('Plantas/Corais'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantaView(),
                ),
              )
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/turtle.png'),
            ),
            title: Text('Tartarugas'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TartarugaListaView(),
                ),
              )
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/comunidade.png'),
            ),
            title: Text('Comunidade'),
            onTap: () => {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Aba COMUNIDADE ainda não foi criada"))),
              Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/about.png'),
            ),
            title: Text('Sobre'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutView(),
                ),
              )
            },
          ),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/logout.png'),
            ),
            title: Text('Sair'),
            onTap: () => {AuthService().logout()},
          ),
        ],
      ),
    );
  }
}
