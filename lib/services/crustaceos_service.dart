import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/crustaceo.dart';

class CrustaceoService {
  CollectionReference crustaceo =
      FirebaseFirestore.instance.collection('crustaceo');

  CrustaceoService() {}

  void registrarCrustaceo(
      nomePopular,
      nomeCientifico,
      classe,
      ordem,
      familia,
      genero,
      origem,
      tipo,
      tipoHabitat,
      tamanho,
      expectativa,
      populacaoMinima,
      tipoAquario,
      volumeMinimo,
      fachadaMinima,
      phAgua,
      temperatura,
      dificuldade,
      imagem) {
    crustaceo.add({
      'nomePopular': nomePopular,
      'nomeCientifico': nomeCientifico,
      'classe': classe,
      'ordem': ordem,
      'familia': familia,
      'genero': genero,
      'origem': origem,
      'tipo': tipo,
      'tipoHabitat': tipoHabitat,
      'tamanho': tamanho,
      'expectativa': expectativa,
      'populacaoMinima': populacaoMinima,
      'tipoAquario': tipoAquario,
      'volumeMinimo': volumeMinimo,
      'fachadaMinima': fachadaMinima,
      'phAgua': phAgua,
      'temperatura': temperatura,
      'dificuldade': dificuldade,
      'imagem': imagem,
    });
  }

  Future<List<Crustaceo?>?> getAll(tipo) async {
    List<Crustaceo> posts = [];
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
    return posts;
  }
}
