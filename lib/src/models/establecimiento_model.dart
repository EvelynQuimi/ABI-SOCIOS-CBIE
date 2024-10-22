class CategoriasModelo {
  int? idCompraCategoria;
  String? nombreCompraCategoria;
  String? fotoCategoria;
  
  List<SubCategoriaModelo> subcategorias = [];

  CategoriasModelo({
    this.fotoCategoria,
    this.idCompraCategoria,
    this.nombreCompraCategoria,
    required this.subcategorias,
  });

  factory CategoriasModelo.fromJson(Map<String, dynamic> json) {
    return CategoriasModelo(
        fotoCategoria: json["fotoCategoria"],
        idCompraCategoria: json["idCompraCategoria"],
        nombreCompraCategoria: json["nombreCompraCategoria"],
        subcategorias: json["subcategorias"]);
  }
}

class SubCategoriaModelo {
  int? idCompraSubCategoria;
  String nombreCompraSubCategoria;
  String fotoCompraSubCategoria;
  int? idCategoria;
  String descripcion_completa_ben;
  String latitud;
  String altitud;

  SubCategoriaModelo({
    required this.fotoCompraSubCategoria,
    this.idCategoria,
    this.idCompraSubCategoria,
    required this.nombreCompraSubCategoria,
    required this.descripcion_completa_ben,
    required this.altitud,
    required this.latitud,
  });

  factory SubCategoriaModelo.fromJson(Map<String, dynamic> json) {
    return SubCategoriaModelo(
        fotoCompraSubCategoria: json["fotoCompraSubCategoria"],
        idCategoria: json["idCategoria"],
        idCompraSubCategoria: json["idCompraSubCategoria"],
        nombreCompraSubCategoria: json["nombreCompraSubCategoria"],
        descripcion_completa_ben: json["descripcion_completa_ben"],
        latitud: json["latitud"],
        altitud: json["altitud"]);
  }
}
