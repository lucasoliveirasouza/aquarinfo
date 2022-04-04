
import 'package:flutter/material.dart';
import 'package:infoquario/services/auth_service.dart';
import 'package:infoquario/view/auth/login_view.dart';
import 'package:infoquario/view/home/home.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {

    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading){
      return loading();
    }else if(auth.usuario == null){

      return LoginView();
    }else{

      return HomeView();
    }
  }

  loading(){
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
