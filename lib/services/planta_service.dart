import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/planta.dart';

class PlantaService {


  String? registrarPlanta(planta) {

    try {
      CollectionReference plantaColecao = FirebaseFirestore.instance.collection('planta');
      plantaColecao.add({planta});
      return "Comentário cadastrado!";
    } on FirebaseException catch (e) {
      return e.message;
    }

  }

  Future<List<Planta?>?> getAll(tipo) async {

    List<Planta> posts = [];
    try{
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('planta')
          .orderBy("nomePopular")
          .get();
      snapshot.docs.forEach((d) {
        Planta planta = Planta(
            d["nomePopular"],
            d["nomeCientifico"],
            d["classe"],
            d["ordem"],
            d["familia"],
            d["genero"],
            d["origem"],
            d["tipo"],
            d["tamanho"],
            d["dificuldade"],
            d["crescimento"],
            d["iluminacao"],
            d["substrato"],
            d["phAgua"],
            d["temperatura"],
            d["imagem"]);
        if (tipo == d["tipo"]) {
          posts.add(planta);
        } else if (tipo == "Todos") {
          posts.add(planta);
        }
      });
    }on FirebaseException catch (e) {
      print(e.toString());
    }

    return posts;
  }
}
