import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/utils/alerts/and_alert.dart';
import 'package:app_socios/utils/alerts/ios_alert.dart';
import 'package:app_socios/utils/header_form_login.dart';
import 'package:app_socios/utils/loading.dart';
import 'package:app_socios/utils/responsive.dart';
import 'package:flutter/material.dart';

class screenlogin extends StatefulWidget {
  const screenlogin({super.key});

  @override
  State<screenlogin> createState() => _screenloginState();
}

class _screenloginState extends State<screenlogin> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //final wsUser = WSUsuario();

  final alertIos = IosAlert();
  final alertAnd = AndroidAlert();

  final txtControllerCI = TextEditingController();
  final txtControllerPassword = TextEditingController();
  final txtControllerMail = TextEditingController();

  final focusNode = FocusNode();
  final mailFocusNode = FocusNode();

  bool conditions = false;
  bool autorization = false;

  bool loading = false;

  bool obscure = true;

  double opacity = 1000;

  DateTime? autorizationDate;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();

          setState(() => opacity = 1000);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: options(),
        ),
      ),
    );
  }

  Widget options() => Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Responsive.of(context).hp(45),
              width: double.infinity,
              child: Image.asset(
                "assets/imagen-login.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Color.fromRGBO(255, 255, 255, opacity),
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Responsive.of(context).hp((55)),
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: formRegister(),
            ),
          ),
          if (loading) loadingWidget(text: "Cargando...")
        ],
      );
  Widget formRegister() => Column(
        children: [
          HeaderFormLogin(
            widthPath: 180,
            path: "assets/logo-cbei.png",
            child: Form(
              key: formKey,
              child: Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      onTap: () {
                        setState(() => opacity = 50);
                      },
                      controller: txtControllerCI,
                      validator: (value) =>
                          value!.isEmpty ? "Campo obligatorio *" : null,
                      //keyboardType: const TextInputType.numberWithOptions(
                      //   decimal: false, signed: false),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        labelText: "Correo electrónico",
                        prefixIcon: Icon(
                          Icons.person_pin,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: obscure,
                      onTap: () {
                        setState(() => opacity = 50);
                      },
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          return null;
                        } else {
                          return "Campo obligatorio *";
                        }
                      },
                      focusNode: focusNode,
                      controller: txtControllerPassword,
                      //textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () => setState(() => obscure = !obscure),
                            icon: Icon(!obscure
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined)),
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        labelText: "Contraseña",
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: Container(
                        height: 53,
                        width: 300,
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
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
