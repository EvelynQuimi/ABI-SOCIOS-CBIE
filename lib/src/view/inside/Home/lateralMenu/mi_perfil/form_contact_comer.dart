import 'package:app_socios/src/models/usuario/contacto_model.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/utils/header_container.dart';
import 'package:app_socios/utils/textFields/input_text_form_fields.dart';
import 'package:flutter/material.dart';

class ContacomercialForm extends StatefulWidget {
  @override
  _ContacomercialFormState createState() => _ContacomercialFormState();
}

class _ContacomercialFormState extends State<ContacomercialForm> {
  final _formKey = GlobalKey<FormState>();
  final _comercial = ContactoModel(
    idContacto: 0,
    nombre: '',
    cargo: '',
    correo_asistente: '',
    asistente: '',
    correo_contac: '',
    celular_contac: '',
    tipo_contacto: '',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  HeaderContainer(
                    height_container: 55,
                    alignment_title: Alignment.centerLeft,
                    has_header: true,
                    has_title: false,
                    body: Container(),
                    title: Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      child: text("Nombre"),
                    ),
                    header: Center(
                      child: InputTextFormFields(
                          inputBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Ingrese su Nombre",
                          placeHolder: ""),
                    ),
                  ),
                  // cuadro de texto cédula.
                  SizedBox(height: 15),
                  Column(
                    children: [
                      HeaderContainer(
                        height_container: 55,
                        alignment_title: Alignment.centerLeft,
                        has_header: true,
                        has_title: false,
                        body: Container(),
                        title: Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: text("Cargo"),
                        ),
                        header: Center(
                          child: InputTextFormFields(
                              inputBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              accionCampo: TextInputAction.next,
                              nombreCampo: "Cargo",
                              placeHolder: ""),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      HeaderContainer(
                        height_container: 55,
                        alignment_title: Alignment.centerLeft,
                        has_header: true,
                        has_title: false,
                        body: Container(),
                        title: Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: text("Celular"),
                        ),
                        header: Center(
                          child: InputTextFormFields(
                              inputBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              accionCampo: TextInputAction.next,
                              nombreCampo: "Ingrese Celular",
                              placeHolder: ""),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),
                  Column(
                    children: [
                      HeaderContainer(
                        height_container: 55,
                        alignment_title: Alignment.centerLeft,
                        has_header: true,
                        has_title: false,
                        body: Container(),
                        title: Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: text("Mail"),
                        ),
                        header: Center(
                          child: InputTextFormFields(
                              inputBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              accionCampo: TextInputAction.next,
                              nombreCampo: "Mail",
                              placeHolder: ""),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      HeaderContainer(
                        height_container: 55,
                        alignment_title: Alignment.centerLeft,
                        has_header: true,
                        has_title: false,
                        body: Container(),
                        title: Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: text("Asistente"),
                        ),
                        header: Center(
                          child: InputTextFormFields(
                              inputBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              accionCampo: TextInputAction.next,
                              nombreCampo: "Asistente",
                              placeHolder: ""),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      HeaderContainer(
                        height_container: 55,
                        alignment_title: Alignment.centerLeft,
                        has_header: true,
                        has_title: false,
                        body: Container(),
                        title: Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: text("Mail Asistente"),
                        ),
                        header: Center(
                          child: InputTextFormFields(
                              inputBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              accionCampo: TextInputAction.next,
                              nombreCampo: "Mail Asistente",
                              placeHolder: ""),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _formKey.currentState?.save();
                        // Aquí puedes hacer lo que necesites con los datos
                        print(_comercial.toJson());
                      }
                    },
                    child: Text('Guardar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
