class EstadoModel {
  int? id_Estado;
  String descripcion_estado;

  EstadoModel({
    this.id_Estado,
    required this.descripcion_estado,
  });

  Map<String, dynamic> toJson() => {
        "idEstado": id_Estado,
        "descripcion_estado": descripcion_estado,
      };

  factory EstadoModel.fromJson(Map<String, dynamic> json) => EstadoModel(
        id_Estado: json["id_Estado"],
        descripcion_estado: json["descripcion_estado"] ?? "ACTIVO",
      );
}
