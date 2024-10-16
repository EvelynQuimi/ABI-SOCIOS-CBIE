class ContactoModel {
  int? idContacto;
  String? nombre;
  String? cargo;
  String? celular_contac;
  String ? correo_contac;
  String? asistente;
  String? correo_asistente;
  String? tipo_contacto;

  ContactoModel({
    this.tipo_contacto,
    this.asistente,
     this.correo_asistente,
    this.correo_contac,
     this.celular_contac,
    this.cargo,
    this.nombre,
    this.idContacto,
  });

  Map<String, dynamic> toJson() => {
        "id_contacto": idContacto,
        "nombre": nombre,
        "cargo": cargo,
        "celular_contac": celular_contac,
        "correo_contac": correo_contac,
        "correo_asistente": correo_asistente,
        "asistente": asistente,
        "tipo_contacto": tipo_contacto,
      };

  factory ContactoModel.fromJson(Map<String, dynamic> json) => ContactoModel(
      idContacto: json["id_contacto"],
      nombre: json["nombre"],
      cargo: json["cargo"],
      celular_contac: json["celular_contac"],
      correo_contac: json["correo_contac"],
      correo_asistente: json["correo_asistente"],
      asistente: json["asistente"] ?? "",
      tipo_contacto: json["tipo_contacto"] ?? "");
}
