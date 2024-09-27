import 'package:app_socios/src/view/inside/Home/Notificaciones/Notificaciones.dart';
import 'package:app_socios/src/view/inside/Home/publicar.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class MyAppBar {
  GlobalKey<ScaffoldState> key;

  MyAppBar({required this.key});

  ThemeData themeData = ThemeData();

  AppBar myAppBar(
          {bool? back, BuildContext? context, required Container widgethide}) =>
      AppBar(
        leading: IconButton(
          onPressed: () => key.currentState!.openDrawer(),
          icon: Icon(
            Icons.menu_rounded, //icono de menú
            size: 30,
            color: Colors.grey[600],
          ),
        ),
        titleSpacing: 3,
        title: const Text(
          'CBEI',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 29,
              color: Color.fromARGB(255, 14, 14, 14),
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.add, //Icono de subir post
                size: 30,
              ),
              onPressed: () {}),
          IconButton(
              icon: const Icon(
                Icons.notifications_none, //icono de notificaciones
                size: 30,
              ),
              onPressed: () {}),
        ],
      );

  SliverAppBar mySliverAppBar(BuildContext context,
          {required Widget widgethide}) =>
      SliverAppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0,
          backgroundColor: const Color.fromARGB(
              255, 255, 255, 255), //themeData.scaffoldBackgroundColor,
          /*title: SizedBox(
        width: 130,
        child: Image.asset('assets/abi_praxis_logo.png'),
      ),*/
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => key.currentState!.openDrawer(),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.add, //Icono de subir post
                  size: 30,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.notifications_none, //icono de notificaciones
                  size: 30,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => NotificacionesScreen(context))))
          ],
          floating: true,
          pinned: true,
          snap: false,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20), child: widgethide));
}
