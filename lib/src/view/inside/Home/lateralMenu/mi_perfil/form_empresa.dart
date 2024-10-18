import 'package:app_socios/src/models/usuario/empresa_model.dart';
import 'package:app_socios/src/models/usuario/redsocial_model.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/utils/header_container.dart';
import 'package:app_socios/utils/responsive.dart';
import 'package:app_socios/utils/textFields/input_text_form_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormEmpresa extends StatefulWidget {
  @override
  _FormEmpresaState createState() => _FormEmpresaState();
}

class _FormEmpresaState extends State<FormEmpresa> {
  final _formKey = GlobalKey<FormState>();
  final _empresa = EmpresaModel(
    idEmpresa: 0,
    razon_social: '',
    ruc: '',
    direccion_empresa: '',
    telefono: '',
    correo_empresa: '',
    tipo_empresa: '',
    logo_empresa: '',
    sitio_web: '',
    estado_empresa: '',
  );

  final _redsocial = RedsocialModel(
    id_redsocial_empresa: 0,
    id_empresa: 0,
    id_red_social: 0,
    instagram: '',
    x: '',
    linkedin: '',
    facebook: '',
    whatsapp: '',
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
                    child: Column(children: <Widget>[
                      SizedBox(height: 15),
                      InputTextFormFields(
                          inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Razón Social",
                          placeHolder: ""),

                      SizedBox(height: 15),
                      InputTextFormFields(
                          inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Ingrese RUC",
                          placeHolder: ""),

                      SizedBox(height: 15),
                      InputTextFormFields(
                          inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Ingrese Dirección",
                          placeHolder: ""),

                      SizedBox(height: 15),
                      InputTextFormFields(
                          inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Teléfono",
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
                          nombreCampo: "Sitio Web",
                          placeHolder: ""),

                      SizedBox(height: 15),
                      InputTextFormFields(
                          inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Link o usuario de Instagram",
                          placeHolder: ""),

                      SizedBox(height: 15),
                      InputTextFormFields(
                          inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Link o usuario de X",
                          placeHolder: ""),

                      SizedBox(height: 15),
                      InputTextFormFields(
                          inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Link de Linkedin",
                          placeHolder: ""),

                      InputTextFormFields(
                          inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          accionCampo: TextInputAction.next,
                          nombreCampo: "Link de Facebook",
                          placeHolder: ""),

                      /*TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Nombre o razón social'),
                    onSaved: (value) => _empresa.razon_social = value ?? '',
                    validator: (value) =>
                        value?.isEmpty == true ? 'Ingrese razón social' : null,
                  ),

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Ruc'),
                    onSaved: (value) => _empresa.ruc = value ?? '',
                    validator: (value) =>
                        value?.isEmpty == true ? 'Ingrese RUC' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Dirección'),
                    onSaved: (value) =>
                        _empresa.direccion_empresa = value ?? '',
                    validator: (value) =>
                        value?.isEmpty == true ? 'Ingrese Dirección' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Telefono'),
                    onSaved: (value) => _empresa.telefono = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese número de telefono'
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Mail'),
                    onSaved: (value) => _empresa.correo_empresa = value ?? '',
                    validator: (value) => value?.isEmpty == true
                        ? 'Ingrese su correo electronico'
                        : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Sitio Web'),
                    onSaved: (value) => _empresa.sitio_web = value ?? '',
                    validator: (value) =>
                        value?.isEmpty == true ? 'Ingrese Sitio Web' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Instagram'),
                    onSaved: (value) => _redsocial.instagram = value ?? '',
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
                            print(_empresa.toJson());
                          }
                        },
                        child: Text('Guardar'),
                      ),
                    ]),
                  ),
                ))));
  }
}
