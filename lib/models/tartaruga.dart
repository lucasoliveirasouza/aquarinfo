
import 'package:infoquario/models/animal_aquatico.dart';

class Tartaruga extends AnimalAquatico{

  Tartaruga(
      String nomePopular,
      String nomeCientifico,
      String classe,
      String ordem,
      String familia,
      String genero,
      String origem,
      String tipoAgua,
      String tipo,
      String tamanho,
      String expectativa,
      String populacaoMinima,
      String tipoAquario,
      String volumeMinimo,
      String fachadaMinima,
      String phAgua,
      String temperatura,
      String dificuldade,
      String imagem) : super(nomePopular, nomeCientifico, classe, ordem, familia, genero, origem, tipoAgua, tipo, tamanho, expectativa, populacaoMinima, tipoAquario, volumeMinimo, fachadaMinima, phAgua, temperatura, dificuldade, imagem);

  String toString(){
    String retorno = "";

    retorno+= 'nomePopular:' + nomePopular + ',';
    retorno+= 'nomeCientifico:' + nomeCientifico + ',';
    retorno+= 'classe:' + classe + ',';
    retorno+= 'ordem:' + ordem + ',';
    retorno+= 'familia:' + familia + ',';
    retorno+= 'genero:' + genero + ',';
    retorno+= 'origem:' + origem + ',';
    retorno+= 'tipoAgua:' + tipoAgua + ',';
    retorno+= 'tipo:' + tipo + ',';
    retorno+= 'tamanho:' + tamanho + ',';
    retorno+= 'expectativa:' + expectativa + ',';
    retorno+= 'populacaoMinima:' + populacaoMinima + ',';
    retorno+= 'tipoAquario:' + tipoAquario + ',';
    retorno+= 'volumeMinimo:' + volumeMinimo + ',';
    retorno+= 'fachadaMinima:' + fachadaMinima + ',';
    retorno+= 'phAgua:' + phAgua + ',';
    retorno+= 'temperatura:' + temperatura + ',';
    retorno+= 'dificuldade:' + dificuldade + ',';
    retorno+= 'imagem:' + imagem + ',';

    return retorno;
  }
}
