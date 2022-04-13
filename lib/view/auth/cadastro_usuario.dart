import 'package:flutter/material.dart';
import 'package:infoquario/services/auth_service.dart';
import 'package:infoquario/services/usuario_service.dart';
import 'package:provider/provider.dart';

class CadastroUsuarioView extends StatefulWidget {
  const CadastroUsuarioView({Key? key}) : super(key: key);

  @override
  State<CadastroUsuarioView> createState() => _CadastroUsuarioViewState();
}

class _CadastroUsuarioViewState extends State<CadastroUsuarioView> {
  final senha = TextEditingController();
  final email = TextEditingController();
  final nome = TextEditingController();
  final confirmarSenha = TextEditingController();
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
                "Crie sua conta",
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
              controller: nome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Informe o email corretamente";
                } else {
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
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Informe o email corretamente";
                } else {
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
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Informe a senha corretamente";
                } else if (value.length < 6) {
                  return "A senha deve ter pelo menos 6 caracteres";
                } else {
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
            TextFormField(
              controller: confirmarSenha,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Confirme sua senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Informe a senha corretamente";
                } else if (value.length < 6) {
                  return "A senha deve ter pelo menos 6 caracteres";
                } else {
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
                child: Text("Cadastrar"),
                onPressed: () {
                  if (senha.text != confirmarSenha.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("As senhas não conferem")));
                  } else {
                    UsuarioService()
                        .cadastrarUsuario(nome.text, email.text, senha.text);
                    registrar();
                    Navigator.of(context).pop();
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
                    "Voltar ao Login",
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )),
          ],
        ),
      ),
    );
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
