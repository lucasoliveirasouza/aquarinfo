import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/crustaceo.dart';

class CrustaceoService {
  CollectionReference crustaceo =
      FirebaseFirestore.instance.collection('crustaceo');

  String? registrarCrustaceo(crustaceo) {
    try {
      CollectionReference crustaceo =
      FirebaseFirestore.instance.collection('crustaceo');
      crustaceo.add({crustaceo});
      return "Comentário cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<List<Crustaceo?>?> getAll(tipo) async {
    List<Crustaceo> posts = [];
    try{
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('crustaceo')
          .orderBy("nomePopular")
          .get();
      snapshot.docs.forEach((d) {
        Crustaceo crustaceo = Crustaceo(
            d["nomePopular"],
            d["nomeCientifico"],
            d["classe"],
            d["ordem"],
            d["familia"],
            d["genero"],
            d["origem"],
            d["tipoHabitat"],
            d["tipo"],
            d["tamanho"],
            d["expectativa"],
            d["populacaoMinima"],
            d["tipoAquario"],
            d["volumeMinimo"],
            d["fachadaMinima"],
            d["phAgua"],
            d["temperatura"],
            d["dificuldade"],
            d["imagem"]);
        if (tipo == d["tipo"]) {
          posts.add(crustaceo);
        } else if (tipo == "Todos") {
          posts.add(crustaceo);
        }
      });
    } on FirebaseException catch (e) {
      print(e.toString());
    }

    return posts;
  }
}
