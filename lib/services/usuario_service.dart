import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioService {
  UsuarioService() {}

  String? cadastrarUsuario(nome, email, senha) {
    try {
      CollectionReference usuarios =
          FirebaseFirestore.instance.collection('usuarios');
      usuarios.add({
        'nome': nome, // John Doe
        'email': email,
        'senha': senha, // Stokes and Sons
        'imagem': "",
      });
      return "Usuario cadastrado";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String?> getUser(email) async {
    String nome = "";
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('usuarios').get();
    snapshot.docs.forEach((d) {
      if (d['email'] == email) {
        nome = d['nome'];
      }
    });
    return nome;
  }

  Future<String?> getImage(email) async {
    String imagem = "";
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('usuarios').get();
    snapshot.docs.forEach((d) {
      if (d['email'] == email) {
        if (d['imagem'] == "") {
          imagem = 'images/img-2022-04-12 18:41:48.230627.png';
        } else {
          imagem = d['imagem'];
        }
      }
    });
    return imagem;
  }
}
