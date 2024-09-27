class SocioModel {
  int? idSocio;
  int idPersona;

  SocioModel({
    required this.idSocio,
    required this.idPersona,
  });

  factory SocioModel.fromMap(Map<String, dynamic> json) {
    return SocioModel(
      idPersona: json["id_persona"],
      idSocio: json["id_socio"],
    );
  }

  Map<String, dynamic> toMap() => {
        "id_socio": idSocio,
        "id_persona": idPersona,
      };
}
