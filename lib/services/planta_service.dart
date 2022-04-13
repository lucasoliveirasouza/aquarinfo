import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/planta.dart';


class PlantaService {
  CollectionReference planta =
  FirebaseFirestore.instance.collection('planta');

  PlantaService() {}

  void registrarPlanta(
      nomePopular,
      nomeCientifico,
      classe,
      ordem,
      familia,
      genero,
      origem,
      tipo,
      tamanho,
      dificuldade,
      crescimento,
      iluminacao,
      substrato,
      phAgua,
      temperatura,
      imagem) {
    planta.add({
      'nomePopular': nomePopular,
      'nomeCientifico': nomeCientifico,
      'classe': classe,
      'ordem': ordem,
      'familia': familia,
      'genero': genero,
      'origem': origem,
      'tipo': tipo,
      'tamanho': tamanho,
      'dificuldade': dificuldade,
      'crescimento': crescimento,
      'iluminacao': iluminacao,
      'substrato': substrato,
      'phAgua': phAgua,
      'temperatura': temperatura,
      'imagem': imagem,
    });
  }

  Future<List<Planta?>?> getAll() async {
    List<Planta> posts = [];
    QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('planta').get();
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
      posts.add(planta);
    });
    return posts;
  }
}
