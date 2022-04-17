
import 'package:infoquario/models/ser_vivo.dart';

class AnimalAquatico extends SerVivo{
  late String _tipoAgua,_expectativa, _populacaoMinima, _tipoAquario,  _volumeMinimo, _fachadaMinima, _phAgua, _temperatura;

  AnimalAquatico(
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
      String imagem)
      : super(nomePopular,nomeCientifico,classe,ordem,familia,genero,origem,tipo,tamanho,dificuldade,imagem){
    this._tipoAgua = tipoAgua;
    this._expectativa = expectativa;
    this._populacaoMinima = populacaoMinima;
    this._tipoAquario = tipoAquario;
    this._volumeMinimo = volumeMinimo;
    this._fachadaMinima = fachadaMinima;
    this._phAgua = phAgua;
    this._temperatura = temperatura;

  }

  get temperatura => _temperatura;

  set temperatura(value) {
    _temperatura = value;
  }

  get phAgua => _phAgua;

  set phAgua(value) {
    _phAgua = value;
  }

  get fachadaMinima => _fachadaMinima;

  set fachadaMinima(value) {
    _fachadaMinima = value;
  }

  get volumeMinimo => _volumeMinimo;

  set volumeMinimo(value) {
    _volumeMinimo = value;
  }

  get tipoAquario => _tipoAquario;

  set tipoAquario(value) {
    _tipoAquario = value;
  }

  get populacaoMinima => _populacaoMinima;

  set populacaoMinima(value) {
    _populacaoMinima = value;
  }

  String get expectativa => _expectativa;

  set expectativa(String value) {
    _expectativa = value;
  }
}