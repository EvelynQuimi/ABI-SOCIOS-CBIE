class PublicacionModel {
  int? idPublicacion;
  String idsocio;
  String estado_publicacion;
  String descripcion_publicacion;
  String hora_publicacion;

  PublicacionModel({
    required this.idPublicacion,
    required this.estado_publicacion,
    required this.descripcion_publicacion,
    required this.idsocio,
    required this.hora_publicacion,
  });

  Map<String, dynamic> toJson() => {
        "id_publicacion": idPublicacion,
        "id_socio": idsocio,
        "estado_publicacion": estado_publicacion,
        "hora_publicacion": hora_publicacion,
        "descripcion_publicacion": descripcion_publicacion,
      };
  factory PublicacionModel.fromJson(Map<String, dynamic> json) =>
      PublicacionModel(
        idPublicacion: json["id_publicacion"],
        idsocio: json["id_socio"],
        estado_publicacion: json["estado_publicacion"],
        descripcion_publicacion: json["descripcion_publicacion"],
        hora_publicacion: json["hora_publicacion"],
      );
}
