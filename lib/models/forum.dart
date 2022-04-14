class Forum {
  late String id, categoria, assunto, descricao, usuario, hora;

  Forum(String id, String categoria, String assunto, String descricao,
      String usuario, String hora) {
    this.id = id;
    this.categoria = categoria;
    this.assunto = assunto;
    this.descricao = descricao;
    this.usuario = usuario;
    this.hora = hora;
  }
}
