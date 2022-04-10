
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infoquario/services/auth_service.dart';
import 'package:infoquario/view/about/about_view.dart';
import 'package:infoquario/view/aquarium/aquarium_view.dart';
import 'package:infoquario/view/crustacean/crustacean_view.dart';
import 'package:infoquario/view/saltwater_fish/saltwater_fish_view.dart';
import 'package:infoquario/view/turtle/turtle_view.dart';


class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(

        children: [
          Container(
              height: 110,
              child: DrawerHeader(
                child: ListTile(

                  title: Text(
                      "Lucas Oliveira",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                  ),
                  leading: CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage('assets/fishlogin.png'),
                    backgroundColor: Colors.transparent,
                  ),

                ),
              )
          ),
          ListTile(
            leading: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset('assets/fish.png'),
            ),
            title: Text('Peixes de água doce'),
            onTap: () => {
              Navigator.of(context).pop()
            },
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
                  builder: (context) => SaltwaterFishView(),
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
                  builder: (context) => CrustaceanView(),
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
                  builder: (context) => TurtleView(),
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
            title: Text('Aquários'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AquariumView(),
                ),
              )
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
            onTap: () => {
              AuthService().logout()
            },
          ),


        ],

      ),


    );
  }
}
