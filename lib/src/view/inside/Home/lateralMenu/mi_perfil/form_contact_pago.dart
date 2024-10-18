import 'package:app_socios/src/models/usuario/contacto_model.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/utils/header_container.dart';
import 'package:app_socios/utils/textFields/input_text_form_fields.dart';
import 'package:flutter/material.dart';

class FormContactPago extends StatefulWidget {
  @override
  _FormContactPagoState createState() => _FormContactPagoState();
}

class _FormContactPagoState extends State<FormContactPago> {
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
                  InputTextFormFields(
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      accionCampo: TextInputAction.next,
                      nombreCampo: "Ingrese su Nombre",
                      placeHolder: ""),

                  // cuadro de texto cédula.
                  SizedBox(height: 15),
                  InputTextFormFields(
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      accionCampo: TextInputAction.next,
                      nombreCampo: "Cargo",
                      placeHolder: ""),

                  SizedBox(height: 15),
                  InputTextFormFields(
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      accionCampo: TextInputAction.next,
                      nombreCampo: "Ingrese Celular",
                      placeHolder: ""),

                  SizedBox(height: 15),
                  InputTextFormFields(
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      accionCampo: TextInputAction.next,
                      nombreCampo: "Mail",
                      placeHolder: ""),

                  SizedBox(height: 15),
                  InputTextFormFields(
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      accionCampo: TextInputAction.next,
                      nombreCampo: "Asistente",
                      placeHolder: ""),

                  SizedBox(height: 15),
                  InputTextFormFields(
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      accionCampo: TextInputAction.next,
                      nombreCampo: "Mail Asistente",
                      placeHolder: ""),

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
