import 'package:app_socios/src/Controller/database.dart';
import 'package:app_socios/src/models/usuario/empresa_model.dart';
import 'package:app_socios/src/models/usuario/persona_model.dart';
import 'package:sqflite/sqflite.dart';

class Operaciones {
  //todo aqui se colocan los nombres delas tablas creadas.
  final String _tblpersona = "tbl_persona";
  final String _tblempresa = "tbl_empresa";

//todo inicializar DB
  Future<Database> _initDatabase() async {
    final db = DatabaseProvider();
    return await db.database;
  }
//todo operaciones persona

  Future<int> crearPersona(PersonaModel per) async {
    final Database db = await _initDatabase();
    var res = await db.insert(_tblpersona, per.toJson());
    return res;
  }

  Future<int> actualizarPersona(PersonaModel per) async {
    final Database db = await _initDatabase();
    var res = await db.update(_tblpersona, per.toJson(),
        where: "id_persona = ?", whereArgs: [DatabaseProvider.id_persona]);
    return res;
  }

  //todo operaciones empresa.
  // Future<int> insertarEmpresa(EmpresaModel empre) async {
  // final Database db = await _initDatabase();
  //var res = await db.insert(_tblempresa, empre.toJson());
  //if (res != 0) {
  //debugPrint("Empresa: $res");
  //}
  //}
}
