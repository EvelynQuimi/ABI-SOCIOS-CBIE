import 'package:app_socios/src/models/usuario/contacto_model.dart';
import 'package:app_socios/src/models/usuario/persona_model.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/utils/header_container.dart';
import 'package:app_socios/utils/textFields/input_text_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class PersonaForm extends StatefulWidget {
  @override
  _PersonaFormState createState() => _PersonaFormState();
}

class _PersonaFormState extends State<PersonaForm> {
  final _formKey = GlobalKey<FormState>();
  final _contacto = ContactoModel(
    idContacto: 0,
    nombre: '',
    cargo: '',
    correo_asistente: '',
    asistente: '',
    correo_contac: '',
    celular_contac: '',
    tipo_contacto: '',
  );

  final _persona = PersonaModel(
    idPersona: 0,
    cedula: '',
    nombres: '',
    apellidos: '',
    celular: '',
    correo: '',
    empresa: '',
    pais: 'Ecuador',
    provincia: 'Guayas',
    ciudad: 'Guayaquil',
    contrasena: '',
    foto_perfil: '',
    fecha_nac: '',
    convencional: '',
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
                  SizedBox(height: 15),
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
                      nombreCampo: "Ingrese Número de cédula",
                      placeHolder: ""),

                  SizedBox(height: 15),
                  InputTextFormFields(
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      accionCampo: TextInputAction.next,
                      nombreCampo: "Ingrese Telefono celular",
                      placeHolder: ""),

                  SizedBox(height: 15),
                  InputTextFormFields(
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      accionCampo: TextInputAction.next,
                      nombreCampo: "Telefono convencional",
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

                  /*TextFormField(
                    decoration: InputDecoration(labelText: 'Nombre'),
                    onSaved: (value) => _contacto.nombre = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese su nombre completo'
                        : null,
                  ),

                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Cédula de Identidad'),
                    onSaved: (value) => _persona.cedula = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese número de cédula'
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Telefono celular'),
                    onSaved: (value) => _persona.celular = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese número de telefono'
                        : null,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Telefono convencional'),
                    onSaved: (value) => _persona.convencional = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese número de telefono convencional'
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mail'),
                    onSaved: (value) => _persona.correo = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese su correo electronico'
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Asistente'),
                    onSaved: (value) => _contacto.asistente = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese nombre de Asistente'
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mail Asistente'),
                    onSaved: (value) =>
                        _contacto.correo_asistente = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese mail de Asistente'
                        : null,
                  ),*/

                  // Agrega más campos aquí según sea necesario
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _formKey.currentState?.save();
                        // Aquí puedes hacer lo que necesites con los datos
                        print(_persona.toJson());
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
