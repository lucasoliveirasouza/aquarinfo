import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infoquario/models/peixe_agua_doce.dart';

class PeixeAguaDoceService{


  CollectionReference freshwater = FirebaseFirestore.instance.collection('peixeaguadoce');

  PeixeAguaDoceService(){

  }

  void registerFreshwater(nomeCientifico, tipo, nomePopular, expectativa){
    freshwater.add({
      'nomeCientifico': nomeCientifico, // John Doe
      'tipo': tipo,
      'nomePopular': nomePopular,
      'expectativa': expectativa,
    });
  }

  Future<List<PeixeAguaDoce?>?> getAll() async {

    List<PeixeAguaDoce> posts = [];

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('peixeaguadoce').get();

    snapshot.docs.forEach((d) {
      PeixeAguaDoce peixe = new PeixeAguaDoce(d["nomeCientifico"], d["tipo"], d["nomePopular"], d["expectativa"]);
      posts.add(peixe);
    });

    return posts;
  }
}