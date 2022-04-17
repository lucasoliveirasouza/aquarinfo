import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/peixe.dart';


class PeixeService {

  void registrarPeixe(nomePopular, nomeCientifico, classe, ordem, familia, genero, origem, tipoAgua, tipo, tamanho, expectativa, populacaoMinima, tipoAquario, volumeMinimo, fachadaMinima, phAgua, temperatura, dificuldade, imagem) {
    if(tipoAgua == "Doce"){
      CollectionReference aguadoce = FirebaseFirestore.instance.collection('peixeaguadoce');
      aguadoce.add({
        'nomePopular': nomePopular,
        'nomeCientifico': nomeCientifico,
        'classe': classe,
        'ordem': ordem,
        'familia': familia,
        'genero': genero,
        'origem': origem,
        'tipoAgua': tipoAgua,
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
    }else if(tipoAgua == "Salgada"){
      CollectionReference peixeaguasalgada = FirebaseFirestore.instance.collection('peixeaguasalgada');
      peixeaguasalgada.add({
        'nomePopular': nomePopular,
        'nomeCientifico': nomeCientifico,
        'classe': classe,
        'ordem': ordem,
        'familia': familia,
        'genero': genero,
        'origem': origem,
        'tipoAgua': tipoAgua,
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

  }

  Future<List<Peixe?>?> getAll(tipo, tipoAgua) async {
    List<Peixe> posts = [];
    QuerySnapshot snapshot;

    if(tipoAgua == "Salgada"){
      snapshot = await FirebaseFirestore.instance
          .collection('peixeaguasalgada')
          .orderBy("nomePopular")
          .get();
    }else{
      snapshot = await FirebaseFirestore.instance
          .collection('peixeaguadoce')
          .orderBy("nomePopular")
          .get();
    }
    snapshot.docs.forEach((d) {
      Peixe peixe = Peixe(
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
      if (d["tipo"] == tipo) {
        posts.add(peixe);
      } else if (tipo == "Todos") {
        posts.add(peixe);
      }
    });
    return posts;
  }
}

