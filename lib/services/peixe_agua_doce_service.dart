import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/peixe_agua_doce.dart';

class PeixeAguaDoceService{

  CollectionReference freshwater = FirebaseFirestore.instance.collection('peixeaguadoce');
  PeixeAguaDoceService(){
  }

  void registerFreshwater(nomePopular,nomeCientifico,classe,ordem,familia,genero,origem,tipo,tamanho,expectativa,populacaoMinima,tipoAquario,volumeMinimo,fachadaMinima,dificuldade,imagem){
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
      'dificuldade': dificuldade,
      'imagem': imagem,
    });
  }

  Future<List<PeixeAguaDoce?>?> getAll(tipo) async {
    List<PeixeAguaDoce> posts = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('peixeaguadoce').get();
    snapshot.docs.forEach((d) {
      PeixeAguaDoce peixe = new PeixeAguaDoce(d["nomeCientifico"], d["tipo"], d["nomePopular"], d["expectativa"],d["imagem"]);
      if(d["tipo"] == tipo){
        posts.add(peixe);
      }else if(tipo == "Todos"){
        posts.add(peixe);
      }
    });
    return posts;
  }
}