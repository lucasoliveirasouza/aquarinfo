import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/forum.dart';

class ForumService {


  String? cadastrarForum(categoria, assunto, descricao, usuario) {
    try {
      CollectionReference forum =
      FirebaseFirestore.instance.collection('forum');
      forum.add({
        'categoria': categoria, // John Doe
        'assunto': assunto,
        'descricao': descricao, // Stokes and Sons
        'usuario': usuario,
      });
      return "Fórum cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<List<Forum?>?> getAll() async {
    List<Forum> foruns = [];
    try{
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('forum').orderBy("assunto").get();
      snapshot.docs.forEach((d) {
        Forum forum = Forum(
            d["categoria"],
            d["assunto"],
            d["descricao"],
            d["usuario"]);
        foruns.add(forum);
      });
      return foruns;
    } on FirebaseException catch (e){
      print(e.toString());
    }
    return foruns;
  }


}