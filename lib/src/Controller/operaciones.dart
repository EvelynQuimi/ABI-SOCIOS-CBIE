import 'dart:math';

import 'package:app_socios/src/Controller/database.dart';
import 'package:app_socios/src/models/networkingModel/empresa_model.dart';
import 'package:app_socios/src/models/usuario/estado_model.dart';
import 'package:app_socios/src/models/usuario/persona_model.dart';
import 'package:app_socios/src/models/usuario/publicacion_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Operaciones {
  //todo aqui se colocan los nombres delas tablas creadas.
  final String _tblpersona = "tbl_persona";
  final String _tblempresa = "tbl_empresa";
  final String _tblsocio = "tbl_socio";
  final String _tblpublicacion = "tbl_publicacion";

//todo inicializar DB
  Future<Database> _initDatabase() async {
    final db = DatabaseProvider();
    return await db.database;
  }

//todo operaciones persona
  Future<int> insertarPersona(PersonaModel per) async {
    final Database db = await _initDatabase();
    var res = await db.insert(_tblpersona, per.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<int> actualizarPersona(PersonaModel per, int idPersona) async {
    final Database db = await _initDatabase();
    var res = await db.update(_tblpersona, per.toJson(),
        where: "id_persona = ?", whereArgs: [idPersona]);
    return res;
  }

  Future<PersonaModel?> obtenerPersona(int idPersona) async {
    final db = await _initDatabase();

    //todo variable instanciada
    PersonaModel? persona;

    final obtper = await db.rawQuery(
            """SELECT * FROM $_tblpersona where id_persona=?""", [idPersona])
        as List<Map<String, dynamic>>;

    if (obtper.isNotEmpty) {
      //todo obtengo la data de la persona en Map<String, dynamic>
      final per = obtper[0];

      //todo convierto el mapa en un modelo de persona por el método de la clase PersonaModel fromJson
      var decode = PersonaModel.fromJson(per);

      //todo asigno la persona decodificad a la variable que instancie al inicio de la función
      persona = decode;

      //otra opcion
      //persona = PersonaModel.fromJson(obtper[0]);
    }

    return persona;
  }

//eliminar solo 1 persona de la tabla
  Future<void> deletePersona(int idPersona) async {
    final db = await _initDatabase();
    await db.delete(_tblpersona, where: "id_persona=?", whereArgs: [idPersona]);
  }

  //eliminar toda latabla persona
  Future<void> deletePersonas() async {
    final db = await _initDatabase();
    await db.delete(_tblpersona);
  }

  //todo operaciones EMPRESA
  Future<int> insertarEmpresa(EmpresaModel empresa) async {
    final Database db = await _initDatabase();
    var emp = await db.insert(_tblempresa, empresa.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return emp;
  }

  Future<int> actualizarEmpresa(EmpresaModel empresa, int idEmpresa) async {
    final Database db = await _initDatabase();
    var res = await db.update(_tblempresa, empresa.toJson(),
        where: "id_empresa = ?", whereArgs: [idEmpresa]);
    return res;
  }

//Obtener empresa
  Future<EmpresaModel?> obtenerEmpresa(int id_empresa) async {
    final db = await _initDatabase();

    //todo variable instanciada
    EmpresaModel? empresa;

    final obtemp = await db.rawQuery(
            """SELECT * FROM $_tblempresa where id_empresa=?""", [id_empresa])
        as List<Map<String, dynamic>>;

    if (obtemp.isNotEmpty) {
      //todo obtengo la data de la persona en Map<String, dynamic>
      final emp = obtemp[0];

      //todo convierto el mapa en un modelo de persona por el método de la clase PersonaModel fromJson
      var decode = EmpresaModel.fromJson(emp);

      //todo asigno la persona decodificad a la variable que instancie al inicio de la función
      empresa = decode;
    }
    return empresa;
  }

  //todo eliminar empresa
  Future<void> deleteEmpresa(int idEmpresa) async {
    final db = await _initDatabase();
    await db.delete(_tblempresa, where: "id_empresa=?", whereArgs: [idEmpresa]);
  }

  //eliminar toda latabla persona
  Future<void> deleteEmpresas() async {
    final db = await _initDatabase();
    await db.delete(_tblempresa);
  }
//todo operaciones de publicacion

  Future<int> insertarPublicacion(PublicacionModel publi) async {
    final Database db = await _initDatabase();
    var pub = await db.insert(_tblpublicacion, publi.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return pub;
  }
}

  //Future<int> obtenerPublicaciones() async {
  // final db = await _initDatabase();
  // final public = await db.rawQuery("""SELECT * FROM $_tblsocio AS soc JOIN $_tblpublicacion AS publ on publ.id_publicacion = soc.id_publicacion WHERE);

