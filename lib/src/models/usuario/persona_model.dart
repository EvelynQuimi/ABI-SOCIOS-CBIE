class PersonaModel {
  int? idPersona;
  String cedula;
  String nombres;
  String apellidos;
  String fecha_nac;
  String celular;
  String convencional;
  String correo;
  String? pais;
  String? provincia;
  String? ciudad;
  String contrasena;
  String? foto_perfil;
  String empresa;

  PersonaModel({
    required this.cedula,
    required this.nombres,
    required this.apellidos,
    required this.fecha_nac,
    required this.celular,
    required this.correo,
    required this.empresa,
    required this.contrasena,
    required this.convencional,
    this.pais,
    this.provincia,
    this.ciudad,
    this.idPersona,
    this.foto_perfil,
  });

  Map<String, dynamic> toJson() => {
        "id_persona": idPersona,
        "cedula_persona": cedula,
        "nombres_persona": nombres,
        "apellidos_persona": apellidos,
        "fecha_nac_persona": fecha_nac,
        "celular_persona": celular,
        "convencional_persona": convencional,
        "correo_persona": correo,
        "empresa_persona": empresa,
        "pais": pais ?? "Ecuador",
        "provincia": provincia ?? "Guayas",
        "ciudad": ciudad ?? "Guayaquil",
        "contrasena_persona": contrasena,
        "foto_perfil": foto_perfil,
      };

  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
        idPersona: json["id_persona"],
        cedula: json["cedula_persona"],
        nombres: json["nombres_persona"],
        apellidos: json["apellidos_persona"],
        fecha_nac: json["fecha_nac_persona"],
        celular: json["celular_persona"],
        convencional: json["convencional_persona"],
        correo: json["correo_persona"] ?? "",
        empresa: json["empresa_persona"] ?? "",
        pais: json["pais"] ?? "Ecuador",
        provincia: json["provincia"] ?? "Guayas",
        ciudad: json["ciudad"] ?? "Guayaquil",
        contrasena: json["contrasena_persona"],
        foto_perfil: json["foto_perfil"],
      );

  get foto => null;
}
