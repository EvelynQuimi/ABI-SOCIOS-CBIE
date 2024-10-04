import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider.internal();

  static final DatabaseProvider instance = DatabaseProvider.internal();
  factory DatabaseProvider() => instance;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  static initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "socios.db");
    return await databaseConfig(path);
  }

//todo VARIABLES PERSONA
  static const String id_persona = "id_persona";
  static const String cedula = "cedula";
  static const String nombres = "nombres";
  static const String apellidos = "apellidos";
  static const String fecha_nac = "fecha_nacimiento";
  static const String celular = "celular";
  static const String correo = "correo";
  static const String pais = "pais";
  static const String provincia = "provincia";
  static const String ciudad = "ciudad";
  static const String contrasena = "contraseña";
  static const String foto_perfil = "foto_perfil";
  static const String empresa = "empresa";
  static const String hora_registro = "hora_registro";

//TODO VARIABLES ESTADO
  static const String id_estado = "id_estado";
  static const String descripcion_estado = "descripcion_estado";

  //TODO VARIABLES RED SOCIAL
  static const String id_red_social = "id_red_social";
  static const String descripcion_r_social = "descripcion_r_social";

//TODO VARIABLES EMPRESA
  static const String id_empresa = "id_empresa";
  static const String razon_social = "razon_social";
  static const String ruc = "ruc";
  static const String direccion_empresa = "direccion_empresa";
  static const String telefono = "telefono";
  static const String correo_empresa = "correo_empresa";
  static const String tipo_empresa = "tipo_empresa";
  static const String logo_empresa = "logo_empresa";
  static const String estado_empresa = "estado_empresa";

//TODO VARIABLES TIPO DE EMPRESA//
  static const String id_tipo_empresa = "id_tipo_empresa";
  static const String descripcion_tipo_empresa = "descripcion_tipo_empresa";

//TODO VARIABLES SOCIO//
  static const String id_socio = "id_socio";

//TODO VARIABLES SOCIO_EMPRESA//
  static const String id_socio_empresa = "id_socio_empresa";

// TODO VARIABLES SUCURSAL//
  static const String id_sucursal = "id_sucursal";
  static const String direccion_sucursal = "direccion_sucursal";
  static const String latitud = "latitud";
  static const String altitud = "altitud";

//TODO VARIABLES CONTACTO//
  static const String id_contacto = "id_contacto";
  static const String nombre = "nombre";
  static const String cargo = "cargo";
  static const String celular_contac = "celular_contac";
  static const String correo_contac = "correo_contac";
  static const String asistente = "asistente";
  static const String correo_asistente = "correo_asistente";
  static const String tipo_contacto = "tipo_contacto";

//TODO VARIABLES TIPO CONTACTO//
  static const String id_tipo_contacto = "id_tipo_contacto";
  static const String descripcion_t_contact = "descripcion_t_contact";

//TODO VARAIBLES EVENTO (AGENDA)//
  static const String id_evento = " id_evento";
  static const String nombre_evento = "nombre_evento";
  static const String descripcion_corta = "descripcion_corta";
  static const String descripcion_completa = "descripcion_completa";
  static const String fecha_evento = "fecha_evento";
  static const String hora_inicio = "hora_inicio";
  static const String hora_fin = "hora_fin";
  static const String hora_registro_agenda = "hora_registro_agenda";
  static const String lugar_evento = "lugar_evento";
  static const String valor = "valor";
  static const String banner_evento = "banner_evento";
  static const String estado_evento = "estado_evento";

// todo VARIABLES publicacion
  static const String id_publicacion = "id_publicacion";
  static const String estado_publicacion = "estado_publicacion";
  static const String descripcion_publicacion = "descripcion_publicacion";
  static const String hora_publicacion = "hora_publicacion";
  static const String fecha_publicacion = "fecha_publicacion";

//todo VARIABLES fotos publicacion
  static const String id_foto = "id_foto";
  static const String estado_foto = "estado_foto";

//todo VARIABLES likes
  static const String id_like = "id_like";

//TODO VARIABLES BENEFICIOS
  static const String id_beneficio = "id_beneficio";
  static const String descripcion_corta_ben = "descripcion_corta_ben";
  static const String descripcion_completa_ben = "descripcion_completa_ben";
  static const String img_beneficio = "img_beneficio";
  static const String estado_beneficio = "estado_beneficio";
//TODO VARIABLES NOTIFICACIÓN
  static const String id_notificacion = "id_notificacion";
  static const String titulo_notificacion = "titulo_notificacion";
  static const String descripcion_notificacion = "descripcion_notificacion";
  static const String estado_notificacion = "estado_notificacion";
  static const String tipo_notificacion = "tipo_notificacion";
//TODO VARIABLES TIPO DE NOTIFICACIÓN
  static const String id_tipo_notificacion = "id_tipo_notificacion";
  static const String descripcion_tipo_notificacion =
      "descripcion_tipo_notificacion";

//Todo base de datos//
  static Future<Database> databaseConfig(String path) async {
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (db, version) async {
      await db.execute("""
    CREATE TABLE IF NOT EXISTS tbl_persona(
    $id_persona INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $cedula TEXT ,
    $nombres TEXT,
    $apellidos TEXT,
    $fecha_nac TEXT,
    $celular TEXT,
    $correo TEXT,
    $pais TEXT,
    $provincia TEXT,
    $ciudad TEXT,
    $empresa TEXT,
    $contrasena TEXT,
    $foto_perfil TEXT,)
    $hora_registro TEXT,
    """);

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_estado(
    $id_estado INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $descripcion_estado TEXT,)
    """);

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_red_social
    $id_red_social INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $descripcion_r_social TEXT,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_empresa(
  $id_empresa INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $razon_social TEXT,
  $ruc TEXT,
  $direccion_empresa TEXT,
  $telefono TEXT,
  $correo_empresa TEXT,
  $tipo_empresa INTEGER,
  $logo_empresa BLOB,
  $estado_empresa INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_tipo_empresa(
  $id_tipo_empresa INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $descripcion_tipo_empresa TEXT,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_socio(
  $id_socio INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $id_persona INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_socio_empresa(
  $id_socio_empresa INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $id_socio INTEGER,
  $id_empresa INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_sucursal(
  $id_sucursal INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $direccion_sucursal TEXT,
  $latitud TEXT,
  $altitud TEXT,
  $id_empresa INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_contacto(
  $id_contacto INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $nombre TEXT,
  $cargo TEXT,
  $celular_contac TEXT,
  $correo_contac TEXT,
  $asistente TEXT,
  $correo_asistente TEXT,
  $tipo_contacto INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_tipo_contacto(
  $id_tipo_contacto INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $descripcion_t_contact  TEXT,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_evento(
  $id_evento INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $nombre_evento TEXT,
  $descripcion_corta TEXT,
  $descripcion_completa TEXT,
  $fecha_evento TEXT,
  $hora_inicio TEXT,
  $hora_fin TEXT,
  $hora_registro_agenda TEXT,
  $lugar_evento TEXT,
  $valor TEXT,
  $banner_evento BLOB,
  $estado_evento INTEGER,
  $id_socio TEXT,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_publicacion(
  $id_publicacion INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $id_socio INTEGER,
  $estado_publicacion INTEGER,
  $descripcion_publicacion TEXT,
  $fecha_publicacion INTEGER,
  $hora_publicacion INTEGER,

  )""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_fotos_publicacion(
  $id_foto INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $estado_foto INTEGER,
  $id_publicacion INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_likes(
  $id_like INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $id_persona INTEGER,
  $id_socio INTEGER,
  $id_publicacion INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_beneficio(
  $id_beneficio INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $descripcion_corta_ben TEXT,
  $descripcion_completa_ben TEXT,
  $img_beneficio BLOB,
  $estado_beneficio INTEGER,
  $id_empresa INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_notificacion(
  $id_notificacion INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $titulo_notificacion TEXT,
  $descripcion_notificacion TEXT,
  $estado_notificacion INTEGER,
  $tipo_notificacion INTEGER,)""");

      await db.execute("""CREATE TABLE IF NOT EXIST tbl_tipo_notificacion(
  $id_tipo_notificacion INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $descripcion_tipo_notificacion TEXT,)""");
    });
  }
}
