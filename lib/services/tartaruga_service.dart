import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/tartaruga.dart';

class TartarugaService {



  String? registrarTartaruga(tartaruga) {
    try {
      CollectionReference tartaruga = FirebaseFirestore.instance.collection('tartaruga');
      tartaruga.add({tartaruga});
      return "Comentário cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }


  }

  Future<List<Tartaruga?>?> getAll() async {
    List<Tartaruga> posts = [];

    try{
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('tartaruga')
          .orderBy("nomePopular")
          .get();
      snapshot.docs.forEach((d) {
        Tartaruga tartaruga = Tartaruga(
            d["nomePopular"],
            d["nomeCientifico"],
            d["classe"],
            d["ordem"],
            d["familia"],
            d["genero"],
            d["origem"],
            d["tipoAgua"],
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
        posts.add(tartaruga);
      });
    }on FirebaseException catch (e) {
      print(e.toString());
    }

    return posts;
  }
}
