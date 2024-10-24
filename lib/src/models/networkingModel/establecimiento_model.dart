import 'package:app_socios/src/models/networkingModel/sucursales_model.dart';

class CategoriasModelo {
  int? idCompraCategoria;
  String? nombreCompraCategoria;
  String? fotoCategoria;

  List<EstablecimientoModel> subcategorias = [];

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
      subcategorias: json["subcategorias"],
    );
  }
}

class EstablecimientoModel {
  int? idCompraSubCategoria;
  String nombreCompraSubCategoria;
  String fotoCompraSubCategoria;
  int? idCategoria;
  String descripcion_completa_ben;
  String latitud;
  String longitud;
  String descripcionesta;
  List<SucursalesModel> sucursales;
  

  EstablecimientoModel(
      {required this.fotoCompraSubCategoria,
      this.idCategoria,
      this.idCompraSubCategoria,
      required this.nombreCompraSubCategoria,
      required this.descripcion_completa_ben,
      required this.longitud,
      required this.latitud,
      required this.descripcionesta,
      required this.sucursales});

  /*  factory EstablecimientoModel.fromJson(Map<String, dynamic> json) {
    return EstablecimientoModel(
      fotoCompraSubCategoria: json["fotoCompraSubCategoria"],
      idCategoria: json["idCategoria"],
      idCompraSubCategoria: json["idCompraSubCategoria"],
      nombreCompraSubCategoria: json["nombreCompraSubCategoria"],
      descripcion_completa_ben: json["descripcion_completa_ben"],
      latitud: json["latitud"],
      longitud: json["longitud"],
      descripcionesta: json["descripcionesta"],
    );
  } */
}
