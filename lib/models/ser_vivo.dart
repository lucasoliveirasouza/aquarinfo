

class SerVivo{

  String _nomePopular, _nomeCientifico, _classe, _ordem, _familia, _genero, _origem, _tipo, _tamanho, _dificuldade, _imagem;

  SerVivo(
      this._nomePopular,
      this._nomeCientifico,
      this._classe,
      this._ordem,
      this._familia,
      this._genero,
      this._origem,
      this._tipo,
      this._tamanho,
      this._dificuldade,
      this._imagem
      );

  get imagem => _imagem;

  set imagem(value) {
    _imagem = value;
  }

  get dificuldade => _dificuldade;

  set dificuldade(value) {
    _dificuldade = value;
  }

  get tamanho => _tamanho;

  set tamanho(value) {
    _tamanho = value;
  }

  get tipo => _tipo;

  set tipo(value) {
    _tipo = value;
  }

  get origem => _origem;

  set origem(value) {
    _origem = value;
  }

  get genero => _genero;

  set genero(value) {
    _genero = value;
  }

  get familia => _familia;

  set familia(value) {
    _familia = value;
  }

  get ordem => _ordem;

  set ordem(value) {
    _ordem = value;
  }

  get classe => _classe;

  set classe(value) {
    _classe = value;
  }

  get nomeCientifico => _nomeCientifico;

  set nomeCientifico(value) {
    _nomeCientifico = value;
  }

  String get nomePopular => _nomePopular;

  set nomePopular(String value) {
    _nomePopular = value;
  }
}