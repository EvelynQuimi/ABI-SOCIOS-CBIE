import 'package:animated_dropdown_search_codespark/animated_dropdown_search_codespark.dart';
import 'package:app_socios/src/models/usuario/empresa_model.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/drawer_menu.dart';
import 'package:app_socios/src/view/inside/Home/screenlogin.dart';
import 'package:app_socios/src/view/inside/Networking/detalle_empresa.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/flushBarGlobal.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:app_socios/utils/list/lista-socios.dart';
import 'package:app_socios/utils/textFields/input_text_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Socios extends StatefulWidget {
  VoidCallback hide;
  VoidCallback show;
  Socios({super.key, required this.hide, required this.show});

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
        FocusScope.of(context).unfocus();
        widget.show();
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
          const SizedBox(height: 10),
          InputTextFields(
              onTap: () => widget.hide(),
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
          Expanded(
              child: showDetail == false
                  ? ListView.builder(
                      //itemExtent: 100,
                      itemCount: cacheSocios.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 15),
                          width: 200,
                          height: 200,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showDetail = true;
                                empresa = cacheSocios[index];
                              });
                            },
                            child: Image.asset(
                              cacheSocios[index]["asset"],
                            ),
                          ),
                        );
                      },
                    )
                  : EmpresaDetailPage(empresa: empresa!)),
        ],
      );

  /* Widget buildEmpresaDetail(Map<String, dynamic> empresa) {
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        empresa["asset"],
        fit: BoxFit.cover,
        width: 80,
        height: 80,
      ),
      SizedBox(height: 3),
      /* Text(
        '${empresa["razon_social"]}',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ), */
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(empresa["descripcion"] ?? "No hay descripción disponible."),
      ),
      SizedBox(height: 5),
      Container(
          padding: EdgeInsets.all(5),
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
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Alinear botones a la derecha
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
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ))
    ]));
  }
 */
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
}
