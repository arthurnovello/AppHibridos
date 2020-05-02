class Note{
  String texto;
  String titulo;
  int id;

  Note(this.texto, this.titulo, {this.id = 0});

  @override
  String toString() {
    return 'Note{texto: $texto, titulo: $titulo, id: $id}';
  }
}