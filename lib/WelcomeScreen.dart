import 'package:app_socios/regScreen.dart';
import 'package:app_socios/src/view/inside/Home/loginScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 164, 200, 227),
          Color.fromARGB(255, 125, 208, 236),
          Color.fromARGB(255, 3, 80, 138),
        ])),
        child: Column(children: [
          //const Padding(
          //  padding: EdgeInsets.only(top: 200.0),
          //  child: Image(image: AssetImage('assets/icons/logo.png')),
          //  ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            ' ABI \nSOCIOS',
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
          ),
          const SizedBox(
            height: 40,
          ),

          //Botón para iniciar sesión.
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const loginScreen()));
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color.fromARGB(255, 3, 3, 3)),
              ),
              child: const Center(
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          //Botón para registrarse o crear cuenta.
          /*GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RegScreen()));
            },
            child: Container(
              height: 53,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              child: const Center(
                child: Text(
                  'Crear Cuenta',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),*/

          // const Spacer(),
          //  const Text(
          //   'Baadalcorp',
          //      style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 0, 0, 0)),
          //     ), //
          //    const SizedBox(
          //     height: 12,
          //   ),
          //   const Image(image: AssetImage('assets/icons/social.png'))
        ]),
      ),
    );
  }
}
