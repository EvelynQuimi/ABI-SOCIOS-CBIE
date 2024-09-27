import 'package:app_socios/utils/app_bar.dart';
import 'package:flutter/material.dart';

class NotificacionesScreen extends StatelessWidget {
  const NotificacionesScreen(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 255, 255, 255),
      ])),
      child: Column(
        children: [
          //const Padding(
          //  padding: EdgeInsets.only(top: 200.0),
          //  child: Image(image: AssetImage('assets/icons/logo.png')),
          //  ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            ' NOTIFICACIONES',
            style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }
}
