class CalendarModel {
  int? idAgenda;
  int idPersona;
  String nombrePersona;
  String fechaReunion;
  String horaInicio;
  String? celular;
  String horaFin;
  String empresa;
  String categoriaProducto;
  String producto;
  String medioContacto;
  String gestion;
  String lugarReunion;
  String resultadoReunion;
  String allDay;
  String observacion;
  String latitud;
  String longitud;
  String? latitudLlegada;
  String? longitudLlegada;
  String correo;
  String? asistio;
  String fotoReferencia;

  ///
  ///0: ACTIVA - 1: CANCELADA
  ///
  int estado;

  CalendarModel(
      {this.idAgenda,
      required this.categoriaProducto,
      required this.empresa,
      required this.gestion,
      required this.idPersona,
      required this.lugarReunion,
      required this.medioContacto,
      required this.nombrePersona,
      required this.producto,
      required this.resultadoReunion,
      required this.allDay,
      required this.fechaReunion,
      required this.horaFin,
      required this.horaInicio,
      required this.observacion,
      required this.latitud,
      required this.longitud,
      required this.correo,
      required this.estado,
      required this.fotoReferencia,
      this.celular,
      this.asistio,
      this.latitudLlegada,
      this.longitudLlegada});

  Map<String, dynamic> toJson() => {
        "id_persona": idPersona,
        "nombres_persona": nombrePersona,
        "empresa_agenda": empresa,
        "categoria_producto": categoriaProducto,
        "producto": producto,
        "medio_contacto": medioContacto,
        "gestion": gestion,
        "lugar_reunion": lugarReunion,
        "resultado_reunion": resultadoReunion,
        "all_day": allDay,
        "fecha_reunion": fechaReunion,
        "hora_inicio": horaInicio,
        "hora_fin": horaFin,
        "observacion": observacion,
        "latitud": latitud,
        "longitud": longitud,
        "correo": correo,
        "longitud_llegada": "",
        "latitud_llegada": "",
        "asistio": "",
        "foto_referencia": "",
        "estado": estado,
        "celular_a": celular ?? ""
      };

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
      idAgenda: json["id_agenda"],
      categoriaProducto: json["categoria_producto"],
      empresa: json["empresa_agenda"],
      gestion: json["gestion"],
      idPersona: json["id_persona"],
      lugarReunion: json["lugar_reunion"],
      medioContacto: json["medio_contacto"],
      nombrePersona: json["nombres_persona"],
      producto: json["producto"],
      resultadoReunion: json["resultado_reunion"],
      allDay: json["all_day"],
      fechaReunion: json["fecha_reunion"],
      horaFin: json["hora_fin"],
      horaInicio: json["hora_inicio"],
      observacion: json["observacion"],
      latitud: json["latitud"],
      longitud: json["longitud"],
      correo: json["correo"],
      latitudLlegada: json["latitud_llegada"],
      longitudLlegada: json["longitud_llegada"],
      asistio: json["asistio"],
      estado: json["estado"],
      fotoReferencia: json["foto_referencia"],
      celular: json["celular_a"]);
}