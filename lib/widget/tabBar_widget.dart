import 'package:app_socios/src/models/post.dart';
import 'package:app_socios/src/view/inside/Emergencia/emergencia.dart';
import 'package:app_socios/src/view/inside/Eventos/Agenda/Eventos.dart';
import 'package:app_socios/src/view/inside/Home/Carrusel_post.dart';
import 'package:app_socios/src/view/inside/Networking/networking.dart';
import 'package:app_socios/src/view/inside/tarjeta_virtual/tarjeta.dart';
import 'package:flutter/material.dart';

Widget tabBarBottom({required TabController controlador}) {
  return TabBar(controller: controlador, tabs: <Widget>[
    Tab(
      icon: Icon(Icons.home_outlined, color: Colors.grey),
    ),
    Tab(
      icon: Icon(Icons.groups_2_outlined, color: Colors.grey),
    ),
    Tab(
      icon: Icon(Icons.calendar_month, color: Colors.grey),
    ),
    Tab(
      icon: Icon(Icons.emergency, color: Colors.grey),
    ),
    Tab(
      icon: Icon(Icons.card_giftcard, color: Colors.grey),
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
