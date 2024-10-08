import 'package:app_socios/src/view/inside/Home/screenlogin.dart';
import 'package:app_socios/utils/alerts/ios_alert.dart';
import 'package:app_socios/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AndroidAlert {
  get op => null;

  void acceptTermCondsAnd(context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            content: const Text(
                "Es necesario que acepte Términos y Condiciones y Autorización de Datos Personales para continuar"),
            actions: [
              nextButton(
                  onPressed: () => Navigator.pop(context), text: "Entendido")
            ],
          );
        });
  }

  void accountExists(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: const Text('Usuario existente'),
            content: const Text(
                'Este número celular ya se encuentra almacenado en nuestra base de datos.'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  nextButton(
                      onPressed: () => Navigator.pop(context),
                      text: "Regresar",
                      width: 100,
                      fontSize: 15),
                  nextButton(
                      onPressed: () => Navigator.pushNamed(context, "login"),
                      text: "Iniciar sesión",
                      width: 110,
                      fontSize: 15),
                ],
              )
            ],
          );
        });
  }

  void incorrectPin(context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            //title: const Text('Usuario existente'),
            content: const Text(
              'Código incorrecto',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            actions: [
              nextButton(
                  onPressed: () => Navigator.pop(context),
                  text: "Volver a intentar",
                  width: 120,
                  fontSize: 15),
            ],
          );
        });
  }

  void errorLogin(context, String title, String error) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: Text(title),
            content: Text(
              error,
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              nextButton(
                  onPressed: () => Navigator.pop(context),
                  text: "Regresar",
                  width: 120,
                  fontSize: 15),
            ],
          );
        });
  }

  void alertaPermisoCamaraManual(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: const Text('Permiso denegado'),
            content: const Text(
                'El permiso a la cámara y galeria ha sido denegado, activelo manualmente'),
            actions: [
              Center(
                  child: TextButton(
                child: const Text('Configuración'),
                onPressed: () {
                  openAppSettings().whenComplete(() => Navigator.pop(context));
                },
              ))
            ],
          );
        });
  }

  void alertaPermisoArchivosManual(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: const Text('Permiso denegado'),
            content: const Text(
                'El permiso a los archivos ha sido denegado, activelo manualmente'),
            actions: [
              Center(
                  child: TextButton(
                child: const Text('Configuración'),
                onPressed: () {
                  openAppSettings().whenComplete(() => Navigator.pop(context));
                },
              ))
            ],
          );
        });
  }

  void cerrarSesion(context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: const Text('Cerrar sesión'),
            content: const Text('¿Desea cerrar su sesión?'),
            actions: [
              TextButton(
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Cerrar sesión'),
                onPressed: () async {
                  final pfrc = await SharedPreferences.getInstance();

                  await op.deleteProspectos();

                  await pfrc.remove("login");
                  FlutterBackgroundService().invoke("stopService");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const screenlogin()));
                },
              ),
            ],
          );
        });
  }

  void alertCapcitacion(context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            content: const Text('Debe capacitarse para empezar a vender'),
            actions: [
              TextButton(
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('Iniciar'),
                onPressed: () async {},
              ),
            ],
          );
        });
  }

  void alertaAgregarEvento(context, DateTime date, Function()? onpressed) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: const Text("Agregar evento"),
            content: Text(
                "Agregara un evento a la siguiente fecha: \n ${DateFormat.MMMEd("es").format(date)}"),
            actions: [
              TextButton(
                child: const Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                onPressed: onpressed,
                child: const Text('Continuar'),
              ),
            ],
          );
        });
  }

  void agendaAgregada(BuildContext context, Function() onPressed) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: const Text("Evento creado"),
            content: const Text(
                "Evento creado. ¿Desea agregar documentos al evento?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
              TextButton(onPressed: onPressed, child: const Text("Si")),
            ],
          );
        });
  }

  void alertSync(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            title: const Text("Sincronización"),
            content: const Text(
                "Para sincronizar su dispositivo, debe tener acceso a internet. Caso contrario, puede perder su información. ¿Está seguro que desea proceder?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("NO"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("SI"),
              )
            ],
          );
        });
  }

  openAppSettings() {}
}
