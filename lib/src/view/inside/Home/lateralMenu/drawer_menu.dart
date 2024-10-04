import 'dart:io';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/mi_perfil/mis_datos.dart';
import 'package:app_socios/utils/alerts/and_alert.dart';
import 'package:app_socios/utils/alerts/ios_alert.dart';
import 'package:app_socios/utils/deviders/divider.dart';
import 'package:app_socios/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/mi_perfil/mis_datos.dart';

Drawer drawerMenu(context, {bool? inicio}) {
  Widget header(context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10),
        height: 165,
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(38, 44, 230, 1),
                    Color.fromRGBO(38, 44, 230, 1),
                    Color.fromRGBO(38, 44, 230, 1),
                    Color.fromRGBO(38, 44, 230, 1),
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.circular(100)),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: FutureBuilder<String>(
                    future: UserPreferences().getPathPhoto(),
                    builder: (builder, snapshot) {
                      return snapshot.hasData &&
                              snapshot.data != null &&
                              snapshot.data != ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "${dotenv.env["ws_dominio"]! + snapshot.data!}?timestamp=${DateTime.now().millisecondsSinceEpoch}",
                                key: UniqueKey(),
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                      child:
                                          LoadingAnimationWidget.discreteCircle(
                                              color: Colors.black, size: 30));
                                },
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(
                              Icons.person,
                              size: 70,
                            );
                    },
                  )),
            ),
            const SizedBox(height: 10),
            FutureBuilder<String>(
                future: UserPreferences().getFullName(),
                builder: (builder, snapshot) {
                  return Text(
                    snapshot.data ?? "< Mi Perfil >",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  );
                }),
            const SizedBox(height: 3)
          ],
        ),
      );

  Widget miPerfil(context) => Column(
        children: [
          /* //todo MI PERFIL
        ExpansionTile(
          title: const Text(
            "Mis Datos",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          leading: const Icon(Icons.person_2_outlined),
          children: [*/
          dividerMenuLateral(),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (builder) => MisDatos()));
            },
            leading: const Icon(Icons.description),
            /*trailing: const Icon(
              Icons.navigate_next_sharp,
              color: Colors.black,
            ),*/
            title: const Text(
              "Mis Datos",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),

          //dividerMenuLateral(),
          /*ListTile(
              onTap: () {},
              leading: const Icon(Icons.account_box_rounded),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Colors.black,
              ),
              title: Container(
                padding: const EdgeInsets.only(left: 40),
                child: const Text(
                  "Cambiar foto de perfil",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            dividerMenuLateral(),*/
          /*ListTile(
              onTap: () => {},
              leading: const Icon(Icons.password),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Colors.black,
              ),
              title: Container(
                padding: const EdgeInsets.only(left: 40),
                child: const Text(
                  "Actualizar contraseña",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),*/

          /* dividerMenuLateral(),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) =>
                          const /*TestStackOverflow()*/ DatosCuentaBanco())),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Colors.black,
              ),
              title: Container(
                padding: const EdgeInsets.only(left: 40),
                child: const Text(
                  "Cambiar foto de perfil",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),*/
        ],
      );

  Widget terminosCondiciones(context) => Column(
        children: [
          //todo INFORMACIÓN CONTÁCTENOS
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.edit_document,
              color: Colors.black,
            ),
            title: const Text(
              "Términos y condiciones",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );

  Widget tutorial(context) => Column(
        children: [
          //todo Tutorial
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(
              Icons.info_outline,
              color: Colors.black,
            ),
            title: const Text(
              "Tutorial",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );

  return Drawer(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), bottomRight: Radius.circular(25))),
    backgroundColor: Colors.white,
    elevation: 50,
    surfaceTintColor: Colors.white,
    shadowColor: Colors.black,
    child: Column(
      children: [
        Expanded(
          child: Column(
            children: [
              //const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 110,
                color: const Color.fromARGB(217, 255, 255, 255),
                padding: const EdgeInsets.only(left: 55, right: 55),
                //child: Image.asset(
                //  "assets/abi_praxis_logo_white.png",
                //  fit: BoxFit.fitHeight,
                // ),
              ),
              header(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    if (inicio != null && !inicio) divider(false),
                    if (inicio != null && !inicio)
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => const HomeScreen()));
                        },
                        leading: const Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Inicio",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    divider(false),
                    miPerfil(context),
                    divider(false),
                    terminosCondiciones(context),
                    divider(false),
                    ListTile(
                      onTap: () => showModal(context),
                      leading: const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Configuración",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    divider(false),
                  ]),
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () => Platform.isAndroid
              ? AndroidAlert().cerrarSesion(context)
              : IosAlert().cerrarSesion(context),
          child: Container(
              height: Platform.isIOS ? 60 : 50,
              color: const Color.fromARGB(255, 81, 81, 81),
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.only(bottom: 15),
                //margin: const EdgeInsets.only(left: 150),
                child: Row(
                  children: [
                    /*Expanded(
                        child: IconButton(
                            tooltip: "Sincronizar datos",
                            onPressed: () => Platform.isAndroid
                                ? AndroidAlert().alertSync(context)
                                : IosAlert().alertSync(context),
                            icon: const Icon(Icons.cloud_sync,
                                size: 35,
                                color: Color.fromARGB(255, 84, 194, 231)))),*/
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'CERRAR SESIÓN',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    ),
  );
}

class UserPreferences {
  getPathPhoto() {}

  getFullName() {}

  savePathPhoto(String newPath) {}

  getIdPersona() {}

  saveIdPerson(decode) {}

  saveUserIdentification(decode) {}
}

void showModal(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      showDragHandle: false,
      context: context,
      builder: (builder) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const ListTile(
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text(
                    "Configuración",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              divider(false),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.info, color: Colors.black),
                title: Text(
                  "Tutorial",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              divider(false),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.ios_share, color: Colors.black),
                title: Text(
                  "Compartir app",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      });
}
