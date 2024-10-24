import 'package:app_socios/src/Controller/operaciones.dart';
import 'package:app_socios/src/Controller/preferences/app_preferences.dart';
import 'package:app_socios/src/models/usuario/persona_model.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WsPersona {
  final String _url = dotenv.env["ws_usuario_dev"]!;

  Future<String> validarUsuarioExiste({required String celular}) async {
    try {
      final data = await http.post(Uri.parse(_url),
          body: jsonEncode({
            "operacion": "get",
            "info": {"celular": celular}
          }));

      if (data.statusCode > 199 && data.statusCode < 300) {
        final list = jsonDecode(data.body);
        if (list.length > 0) {
          return "si";
        } else {
          return "no";
        }
      } else {
        final decode = jsonDecode(data.body);
        final reason = decode["reason"];
        return reason;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> insertarUsuario(PersonaModel usuario) async {
    try {
      final user = await http.post(Uri.parse(_url),
          body: jsonEncode({"operacion": "insert", "info": usuario.toJson()}));

      if (user.statusCode > 199 && user.statusCode < 300) {
        return "si";
      } else {
        return "no";
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> actualizarUsuario(PersonaModel usuario) async {
    final pfrc = UserPreferences();

    final id = await pfrc.getIdPersona();

    try {
      final user = await http.post(Uri.parse(_url),
          body: jsonEncode({
            "operacion": "update",
            "info": usuario.toJson()..addAll({"id_usuario": id})
          }));

      if (user.statusCode > 199 && user.statusCode < 300) {
        return "si";
      } else {
        final decode = jsonDecode(user.body);
        return decode["result"];
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> actualizarDatoUsuario(
      {required String parametro, required String dato}) async {
    final pfrc = UserPreferences();

    final id = await pfrc.getIdPersona();

    try {
      final update = await http.post(Uri.parse(_url),
          body: jsonEncode({
            "operacion": "update_data",
            "info": {"dato": dato, "parametro": parametro, "id_usuario": id}
          }));
      if (update.statusCode > 199 && update.statusCode < 300) {
        final decode = jsonDecode(update.body);

        return decode["result"];
      } else {
        final decode = jsonDecode(update.body);

        return decode["result"];
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> autenticarUser(
      {required String identification, required String password}) async {
    final pfrc = UserPreferences();
    final apppfrc = AppPreferences();
    try {
      final user = await http.post(Uri.parse(_url),
          body: jsonEncode({
            "operacion": "auth",
            "info": {"cedula": identification, "contrasena": password}
          }));

      if (user.statusCode > 199 && user.statusCode < 300) {
        String? nombre;
        String? apellido;
        debugPrint("data: ${user.body}");
        final decode = jsonDecode(user.body);

        Operaciones().insertarPersona(decode);
        await pfrc.saveIdPerson(decode[0]["id_usuario"]);
        await pfrc.saveUserIdentification(decode[0]["cedula"]);
        if (decode[0]["nombres"].contains(" ")) {
          nombre = decode[0]["nombres"].toString().split(" ")[0];
        } else {
          nombre = decode[0]["nombres"];
        }
        if (decode[0]["apellidos"].contains(" ")) {
          apellido = decode[0]["apellidos"].split(" ")[0];
        } else {
          apellido = decode[0]["apellidos"];
        }
        await pfrc.setFullName("$nombre $apellido");
        await pfrc.setUserName(decode[0]["nombres"]);
        await pfrc.setUserLastName(decode[0]["apellidos"]);
        await pfrc.setUserMail(decode[0]["correo"]);
        await pfrc.savePathPhoto(decode[0]["foto"]);

        if (decode[0]["id_persona"] != null) {
          await apppfrc.saveAcademyPage(true);
        } else {
          await apppfrc.saveAcademyPage(false);
        }

        //await initializeWorkManager(); if (data != 0) {
        await initializeService()
            .then((_) => FlutterBackgroundService().invoke("setAsForeground"));

        return "ok";
      } else {
        final decode = jsonDecode(user.body);

        String typeError = decode["status"];
        String errorMessage = decode["result"];

        return "$typeError,$errorMessage";
      }
    } catch (e) {
      debugPrint(e.toString());
      return "error: $e";
    }
  }

  Future<Map<String, dynamic>?> obtenerPerfil() async {
    try {
      final pfrc = UserPreferences();
      final idPerson = await pfrc.getIdPersona();

      final profile = await http.post(Uri.parse(_url),
          body: jsonEncode({
            "operacion": "get-profile",
            "info": {"id_usuario": idPerson}
          }));

      if (profile.statusCode > 199 && profile.statusCode < 300) {
        final decode = jsonDecode(profile.body);

        if (decode["status"] == "ok") {
          return {"id_reg": decode["result"]["id"]};
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> insertarPerfil(int idPersona) async {
    try {
      final pfrc = UserPreferences();
      final pfrcApp = AppPreferences();
      final getId = await pfrc.getIdPersona();

      final user = await http.post(Uri.parse(_url),
          body: jsonEncode({
            "operacion": "insert-profile",
            "info": {"id_persona": idPersona, "id_usuario": getId}
          }));

      if (user.statusCode > 199 && user.statusCode < 300) {
        await pfrcApp.saveProfile(true);
        return "si";
      } else {
        return "no";
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<String> actualizarPerfil(int idPersona, int idReg) async {
    try {
      final pfrc = UserPreferences();
      final id = await pfrc.getIdPersona();

      final profile = await http.post(Uri.parse(_url),
          body: jsonEncode({
            "operacion": "update-profile",
            "info": {
              "id_usuario": id,
              "id_persona": idPersona,
              "id_registro": idReg
            }
          }));
      if (profile.statusCode > 199 && profile.statusCode < 300) {
        return "si";
      } else {
        return "no";
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> obtenerDatosUsuario() async {
    Map<String, dynamic> resultado = {};

    try {
      final pfrc = UserPreferences();
      final getId = await pfrc.getIdPersona();

      final user = await http.post(Uri.parse(_url),
          body: jsonEncode({
            "operacion": "get",
            "info": {"id_socio": getId}
          }));

      if (user.statusCode > 199 && user.statusCode < 300) {
        final decode = jsonDecode(user.body);

        resultado = {"status": "ok", "data": PersonaModel.fromJson(decode[0])};
      } else {
        final decode = jsonDecode(user.body);
        resultado = {"status": "ok", "data": decode[0]};
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return resultado;
  }

  initializeService() {}

  static actualizarPersona(PersonaModel model) {}
}

extension on UserPreferences {
  setFullName(String s) {}

  setUserName(decode) {}

  setUserLastName(decode) {}

  setUserMail(decode) {}
}
