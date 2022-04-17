import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/peixe.dart';

class PeixeAguaDoceService {
  CollectionReference peixeaguadoce =
      FirebaseFirestore.instance.collection('peixeaguadoce');
  PeixeAguaDoceService() {}

  void registerFreshwater(
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
    peixeaguadoce.add({
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

  Future<List<Peixe?>?> getAll(tipo) async {
    List<Peixe> posts = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('peixeaguadoce')
        .orderBy("nomePopular")
        .get();
    snapshot.docs.forEach((d) {
      Peixe peixe = Peixe(
          d["nomePopular"],
          d["nomeCientifico"],
          d["classe"],
          d["ordem"],
          d["familia"],
          d["genero"],
          d["origem"],
          d["tipo"], ////requer atenção
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
      if (d["tipo"] == tipo) {
        posts.add(peixe);
      } else if (tipo == "Todos") {
        posts.add(peixe);
      }
    });
    return posts;
  }
}
