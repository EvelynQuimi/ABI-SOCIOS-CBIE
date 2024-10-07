import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:app_socios/src/models/post.dart';
import 'package:app_socios/src/view/inside/Emergencia/emergencia.dart';
import 'package:app_socios/src/view/inside/Eventos/Agenda/Eventos.dart';
import 'package:app_socios/src/view/inside/Home/Carrusel_post.dart';
import 'package:app_socios/src/view/inside/Networking/networking.dart';
import 'package:app_socios/src/view/inside/tarjeta_virtual/tarjeta.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:flutter/material.dart';

Widget tabBarBottom({required TabController controlador}) {
  return TabBar(controller: controlador, tabs: <Widget>[
    Tab(
      icon: Icon(Abi_socios.casita, color: Colors.black),
    ),
    Tab(
      icon: Icon(
        Abi_socios.networking_icono,
        color: Colors.black,
        size: 35,
      ),
    ),
    Tab(
      icon: Icon(Abi_socios.eventos_icono, color: Colors.black),
    ),
    Tab(
      icon: Icon(Abi_socios.emergencia_icono, color: Colors.black),
    ),
    Tab(
      icon: Icon(Abi_socios.tarjeta_icono, color: Colors.black),
    ),
  ]);
}

Widget tabview(TabController controlador,
    {required GlobalKey<ScaffoldState> key}) {
  return TabBarView(controller: controlador, children: [
    CarruselPost(
      sckey: key,
    ), //publicaciones de usuarios
    TabBarNetworking(
      sckey: key,
    ), //socios y beneficios
    Eventos(sckey: key), //Eventos y agenda
    B_Emergencia(sckey: key),
    Tarjeta_v(sckey: key),
  ]);
}
