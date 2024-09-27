class EmpresaModel {
  int? idEmpresa;
  String razon_social;
  String ruc;
  String direccion_empresa;
  String telefono;
  String correo_empresa;
  String tipo_empresa;
  String? logo_empresa;
  String? estado_empresa;

  EmpresaModel({
    required this.idEmpresa,
    required this.razon_social,
    required this.ruc,
    required this.direccion_empresa,
    required this.telefono,
    required this.correo_empresa,
    required this.tipo_empresa,
    this.logo_empresa,
    this.estado_empresa,
  });

  Map<String, dynamic> toJson() => {
        "id_empresa": idEmpresa,
        "razon_social": razon_social,
        "ruc": ruc,
        "direccion": direccion_empresa,
        "telefono": telefono,
        "correo": correo_empresa,
        "tipo_empresa": tipo_empresa,
        "logo_empresa": logo_empresa,
        "estado": estado_empresa,
      };
  factory EmpresaModel.fromJson(Map<String, dynamic> json) => EmpresaModel(
        idEmpresa: json["id_empresa"],
        razon_social: json["razon_social"],
        ruc: json["ruc"],
        direccion_empresa: json["direccion_empresa"],
        telefono: json["telefono"],
        correo_empresa: json["correo_empresa"],
        tipo_empresa: json["tipo_empresa"],
        logo_empresa: json["logo_empresa"],
        estado_empresa: json["estado_empresa"],
      );
}
