import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/peixe_agua_doce.dart';

class PeixeAguaDoceService{


  CollectionReference freshwater = FirebaseFirestore.instance.collection('peixeaguadoce');

  PeixeAguaDoceService(){

  }

  void registerFreshwater(nomeCientifico, tipo, nomePopular, expectativa, imagem){
    freshwater.add({
      'nomeCientifico': nomeCientifico, // John Doe
      'tipo': tipo,
      'nomePopular': nomePopular,
      'expectativa': expectativa,
      'imagem': imagem,
    });
  }

  Future<List<PeixeAguaDoce?>?> getAll(tipo) async {
    List<PeixeAguaDoce> posts = [];

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('peixeaguadoce').get();
    snapshot.docs.forEach((d) {
      PeixeAguaDoce peixe = new PeixeAguaDoce(d["nomeCientifico"], d["tipo"], d["nomePopular"], d["expectativa"],d["imagem"]);

      if(d["tipo"]==tipo){
        posts.add(peixe);
      }else if(tipo == "Todos"){
        posts.add(peixe);
      }

    });

    return posts;
  }
}