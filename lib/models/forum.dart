class Forum {
  String _id, _categoria, _assunto, _descricao, _usuario, _hora;

  Forum(this._id, this._categoria, this._assunto, this._descricao,
      this._usuario, this._hora);

  get hora => _hora;

  set hora(value) {
    _hora = value;
  }

  get usuario => _usuario;

  set usuario(value) {
    _usuario = value;
  }

  get descricao => _descricao;

  set descricao(value) {
    _descricao = value;
  }

  get assunto => _assunto;

  set assunto(value) {
    _assunto = value;
  }

  get categoria => _categoria;

  set categoria(value) {
    _categoria = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
