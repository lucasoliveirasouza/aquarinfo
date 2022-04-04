

import 'package:flutter/material.dart';
import 'package:infoquario/services/auth_service.dart';
import 'package:infoquario/view/home/home.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final senha = TextEditingController();
  final email = TextEditingController();

  bool isLogin = true;

  late String titulo;
  late String actionButton;
  late String toggleButton;

  void initState(){
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao){
    setState(() {
      isLogin = acao;
      if(isLogin){
        titulo = "Bem vindo";
        actionButton = "Entrar";
        toggleButton = "Ainda não tem conta? Cadastre-se agora";
      }else{
        titulo = "Crie sua conta";
        actionButton = "Cadastrar";
        toggleButton = "Voltar ao login";
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(

              width: 128,
              height: 128,
              child: Image.asset("assets/fishlogin.png"),
            ),

            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                titulo,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "Informe o email corretamente";
                }else{
                  return null;
                }
              },
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: senha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )
              ),
              validator: (value){
                if(value!.isEmpty){
                  return "Informe a senha corretamente";
                }else if(value.length < 6){
                  return "A senha deve ter pelo menos 6 caracteres";
                }else{
                  return null;
                }
              },
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(right: 50, left: 50),
              child: ElevatedButton(
                child: Text(actionButton),
                onPressed: () {
                  if(isLogin){
                    login();
                  }else{
                    registrar();
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              height: 40,
              alignment: Alignment.center,


              child: TextButton(
                child: Text(
                  toggleButton,
                ),
                onPressed: (){
                  setFormAction(!isLogin);
                },
              )
            ),

          ],
        ),
      ),
    );
  }

  login() async{
    try{
      await context.read<AuthService>().login(email.text, senha.text);
    }on AuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
  registrar() async{
    try{
      await context.read<AuthService>().registrar(email.text, senha.text);

    }on AuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
