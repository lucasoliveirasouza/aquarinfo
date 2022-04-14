import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/forum.dart';

class ComentarioService {
  String? cadastrarComentario(descricao, usuario, hora, idForum) {
    try {
      CollectionReference comentario =
          FirebaseFirestore.instance.collection('comentario');
      comentario.add({
        'descricao': descricao, // Stokes and Sons
        'usuario': usuario,
        'hora': hora,
        'idForum': idForum,
      });
      return "Comentário cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<List<Forum?>?> getAll() async {
    List<Forum> foruns = [];
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('forum')
          .orderBy("assunto")
          .get();
      snapshot.docs.forEach((d) {
        print(d.id);

        Forum forum = Forum(d["categoria"], d["assunto"], d["descricao"],
            d["usuario"], d["hora"]);
        foruns.add(forum);
      });
      return foruns;
    } on FirebaseException catch (e) {
      print(e.toString());
    }
    return foruns;
  }
}
