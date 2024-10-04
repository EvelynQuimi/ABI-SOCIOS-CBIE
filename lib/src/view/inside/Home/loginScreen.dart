import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_socios/regScreen.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 189, 220, 243),
              Color.fromARGB(255, 255, 255, 255),
            ]),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              'Bienvenido\nABI Socios!',
              style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.check,
                          color: Color.fromRGBO(159, 159, 159, 1),
                        ),
                        label: Text(
                          'Correo electrónico',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Contraseña',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '¿Olvidó su contraseña?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Recuperar Contraseña',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 255),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 70,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: Container(
                      height: 53,
                      width: 320,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                      child: const Center(
                        child: Text(
                          'Acceder',
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

                  const SizedBox(
                    height: 150,
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // no tengo cuenta
                  /* const Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "No tengo cuenta",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        Text(
                          "Crear cuenta",
                          style: TextStyle(

                              ///done login page
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  )*/
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
