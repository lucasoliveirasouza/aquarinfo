import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/tartaruga.dart';

class TartarugaService {
  CollectionReference tartaruga =
      FirebaseFirestore.instance.collection('tartaruga');

  TartarugaService() {}

  void registrarTartaruga(
      nomePopular,
      nomeCientifico,
      classe,
      ordem,
      familia,
      genero,
      origem,
      tipo,
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
    tartaruga.add({
      'nomePopular': nomePopular,
      'nomeCientifico': nomeCientifico,
      'classe': classe,
      'ordem': ordem,
      'familia': familia,
      'genero': genero,
      'origem': origem,
      'tipo': tipo,
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

  Future<List<Tartaruga?>?> getAll() async {
    List<Tartaruga> posts = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('tartaruga').get();
    snapshot.docs.forEach((d) {
      Tartaruga tartaruga = Tartaruga(
          d["nomePopular"],
          d["nomeCientifico"],
          d["classe"],
          d["ordem"],
          d["familia"],
          d["genero"],
          d["origem"],
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
    return posts;
  }
}
