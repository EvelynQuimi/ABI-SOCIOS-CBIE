import 'package:animated_dropdown_search_codespark/animated_dropdown_search_codespark.dart';
import 'package:app_socios/src/models/usuario/empresa_model.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/drawer_menu.dart';
import 'package:app_socios/src/view/inside/Home/screenlogin.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/flushBarGlobal.dart';
import 'package:app_socios/utils/header_container.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:app_socios/utils/list/lista-socios.dart';
import 'package:app_socios/utils/textFields/input_text_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class Socios extends StatefulWidget {
  VoidCallback hide;
  VoidCallback show;
  VoidCallback hidesearchb;
  VoidCallback showsearch;

  Socios(
      {super.key,
      required this.hide,
      required this.show,
      required this.hidesearchb,
      required this.showsearch});

  @override
  State<Socios> createState() => _SociosState();
}

class _SociosState extends State<Socios> {
  final _searchController = TextEditingController();

  /*  List<EmpresaModel> socios = [];
  List<EmpresaModel> cacheSocios = []; */

  List<Map<String, dynamic>> socios = [];
  List<Map<String, dynamic>> cacheSocios = [];

  bool hasPermission = false;
  bool showSector = false;
  bool showDetail = false;
  Map<String, dynamic>? empresa;

  Future<void> getData() async {
    setState(() => socios = sociosLista);
    setState(() => cacheSocios = socios);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.show();
        widget.showsearch();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        //key: _sckey,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    child: options(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget options() => Column(
        children: [
          SizedBox(height: 10),
          if (!showDetail)
            InputTextFields(
                onTap: () {
                  widget.hide();
                },
                controlador: _searchController,
                onChanged: (value) {
                  /*  setState(  => */ buildSearchList(value);
                },
                inputBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                icon: const Icon(Icons.search),
                placeHolder: "Buscar",
                nombreCampo: "Busqueda por empresa o socio",
                accionCampo: TextInputAction.done),
          /* IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _showCategoryPopup();
            },
          ), */
          Expanded(
              child: showDetail == false
                  ? ListView.builder(
                      //itemExtent: 100,
                      itemCount: cacheSocios.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 180,
                          height: 180,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showDetail = true;
                                empresa = cacheSocios[index];
                              });
                              widget.hidesearchb();
                            },
                            child: Image.asset(
                              cacheSocios[index]["asset"],
                            ),
                          ),
                        );
                      },
                    )
                  : detalles(empresa: empresa!))
        ],
      );

  String getNameEmpresa(String name) {
    final list = name.split(" ");

    switch (list.length) {
      case 5:
        {
          return "${list[0]} ${list[1]} ${list[2]}";
        }
      case 4:
        {
          return "${list[0]} ${list[2]}";
        }
      case 3:
        {
          return "${list[0]} ${list[2]}";
        }
      case 2:
        {
          return "${list[0]} ${list[1]}";
        }
      case 1:
        {
          return list[0];
        }
      default:
        return "";
    }
  }

  Widget detalles({required Map<String, dynamic> empresa}) {
    return SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 30,
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        showDetail = false;
                      });
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              SizedBox(height: 35),
              Image.asset(
                empresa["asset"],
                fit: BoxFit.cover,
                width: 160,
                height: 160,
              ),
              SizedBox(height: 5),
              /* Text(
        ' ${empresa["razon_social"]}',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ), */
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                    empresa["descripcion"] ?? "No hay descripción disponible.",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              SizedBox(height: 3),
              Container(
                padding: EdgeInsets.all(3),
                color: const Color.fromARGB(
                    255, 120, 120, 120), // Color gris del rectángulo
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Presentación institucional',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // Alinear botones a la derecha
                          children: [
                            IconButton(
                              onPressed: () {
                                // Lógica para ver la presentación
                              },
                              icon: Row(
                                children: [
                                  Icon(Abi_socios.descargarpresentacion_icono,
                                      color: Colors.white),
                                  SizedBox(width: 8),
                                ],
                              ),
                            ),
                            SizedBox(width: 10), // Espacio entre botones
                            IconButton(
                              onPressed: () {
                                // Lógica para descargar la presentación
                              },
                              icon: Row(
                                children: [
                                  Icon(Abi_socios.verpresentacion_icono,
                                      color: Colors.white),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 5),
                  HeaderContainer(
                    height_container: 63,
                    alignment_title: Alignment.centerLeft,
                    has_header: true,
                    has_title: true,
                    body: Container(),
                    title: Container(
                      color: Colors.white,
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 8),
                      child: Text(
                        'Nombre del Socio:',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    header: Text(
                      '${empresa["socio"] ?? "No disponible"}',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Column(children: [
                    SizedBox(height: 5),
                    HeaderContainer(
                      height_container: 63,
                      alignment_title: Alignment.centerLeft,
                      has_header: true,
                      has_title: true,
                      body: Container(),
                      title: Container(
                        color: Colors.white,
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 8),
                        child: Text(
                          'Contacto Comercial: ',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                      header: Text(
                        '${empresa["socio"] ?? "No disponible"}',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ]),
                  SizedBox(height: 20), // Espacio antes de los iconos
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Abi_socios.linkedin_icono,
                            size: 40,
                          ), // Aquí puedes usar tu icono de LinkedIn
                          onPressed: () =>
                              _launchURL(empresa["linkedin"] ?? ''),
                        ),
                        IconButton(
                          icon: Icon(Abi_socios.instagram_icono,
                              size:
                                  40), // Aquí puedes usar tu icono de Instagram
                          onPressed: () =>
                              _launchURL(empresa["instagram"] ?? ''),
                        ),
                        IconButton(
                          icon: Icon(Abi_socios.website_icono,
                              size:
                                  40), // Aquí puedes usar tu icono de sitio web
                          onPressed: () =>
                              _launchURL(empresa["sitio_web"] ?? ''),
                        ),
                        IconButton(
                          icon: Icon(Abi_socios.facebook_icono,
                              size:
                                  40), // Aquí puedes usar tu icono de Facebook
                          onPressed: () =>
                              _launchURL(empresa["facebook"] ?? ''),
                        ),
                        IconButton(
                          icon: Icon(Abi_socios.x_icono,
                              size:
                                  40), // Aquí puedes usar tu icono de X (Twitter)
                          onPressed: () => _launchURL(empresa["twitter"] ?? ''),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20), // Espacio adicional
                ],
              ),
            ])));
  }

  List<Map<String, dynamic>> buildSearchList(String value) {
    List<Map<String, dynamic>> sociosLista = [];

    if (value.isNotEmpty) {
      setState(() => showSector = true);
      var filter = socios
          .where((e) =>
              (e["razon_social"].toLowerCase().contains(value.toLowerCase())))
          .toList();

      setState(() => sociosLista = filter);
      setState(() => cacheSocios = sociosLista);
    } else {
      setState(() => showSector = true);
      setState(() => cacheSocios = socios);
      setState(() => sociosLista = socios);
    }

    return sociosLista;
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }
}
