class Comentario {
  String _descricao, _usuario, _hora, _idForum;

  Comentario(this._descricao, this._usuario, this._hora, this._idForum);

  get idForum => _idForum;

  set idForum(value) {
    _idForum = value;
  }

  get hora => _hora;

  set hora(value) {
    _hora = value;
  }

  get usuario => _usuario;

  set usuario(value) {
    _usuario = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }
}
