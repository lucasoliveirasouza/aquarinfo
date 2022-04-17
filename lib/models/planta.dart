
import 'package:infoquario/models/ser_vivo.dart';

class Planta extends SerVivo{

  late String _crescimento, _iluminacao, _substrato, _phAgua, _temperatura;


  Planta(
      String nomePopular,
      String nomeCientifico,
      String classe,
      String ordem,
      String familia,
      String genero,
      String origem,
      String tipo,
      String tamanho,
      String dificuldade,
      String crescimento,
      String iluminacao,
      String substrato,
      String phAgua,
      String temperatura,
      String imagem
      )
      : super(nomePopular,nomeCientifico,classe,ordem,familia,genero,origem,tipo,tamanho,dificuldade,imagem) {

    this.crescimento = crescimento;
    this.iluminacao = iluminacao;
    this.substrato = substrato;
    this.phAgua = phAgua;
    this.temperatura = temperatura;

  }

  get temperatura => _temperatura;

  set temperatura(value) {
    _temperatura = value;
  }

  get phAgua => _phAgua;

  set phAgua(value) {
    _phAgua = value;
  }

  get substrato => _substrato;

  set substrato(value) {
    _substrato = value;
  }

  get iluminacao => _iluminacao;

  set iluminacao(value) {
    _iluminacao = value;
  }

  String get crescimento => _crescimento;

  set crescimento(String value) {
    _crescimento = value;
  }


  String toString() {
    String retorno="";

    return retorno;
  }
}
