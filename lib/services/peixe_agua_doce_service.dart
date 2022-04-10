import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/peixe_agua_doce.dart';

class PeixeAguaDoceService{

  CollectionReference freshwater = FirebaseFirestore.instance.collection('peixeaguadoce');
  PeixeAguaDoceService(){
  }

  void registerFreshwater(nomePopular,nomeCientifico,classe,ordem,familia,genero,origem,tipo,tamanho,expectativa,populacaoMinima,tipoAquario,volumeMinimo,fachadaMinima,phAgua,temperatura,dificuldade,imagem){
    freshwater.add({
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

  Future<List<PeixeAguaDoce?>?> getAll(tipo) async {
    List<PeixeAguaDoce> posts = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('peixeaguadoce').get();
    snapshot.docs.forEach((d) {
      PeixeAguaDoce peixe = PeixeAguaDoce(
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
          d["imagem"]
      );
      if(d["tipo"] == tipo){
        posts.add(peixe);

      }else if(tipo == "Todos"){
        posts.add(peixe);

      }
    });
    return posts;
  }
}