class RedsocialModel {
  int? id_redsocial_empresa;
  int? id_empresa;
  int? id_red_social;
  String? instagram;
  String? x;
  String? linkedin;
  String? facebook;
  String? whatsapp;

  RedsocialModel({
    required this.id_redsocial_empresa,
    this.id_empresa,
    this.id_red_social,
    this.instagram,
    this.x,
    this.linkedin,
    this.facebook,
    this.whatsapp,
  });

  Map<String, dynamic> toJson() => {
        "id_redsocial_empresa": id_redsocial_empresa,
        "id_empresa": id_empresa,
        "id_red_social": id_red_social,
        "instagram": instagram,
        "x": x,
        "linkedin": linkedin,
        "facebook": facebook,
        "whatsapp": whatsapp,
      };

  factory RedsocialModel.fromJson(Map<String, dynamic> json) => RedsocialModel(
        id_redsocial_empresa: json["id_red_social"],
        id_red_social: json["id_red_social"],
        id_empresa: json["id_empresa"],
      );
}
