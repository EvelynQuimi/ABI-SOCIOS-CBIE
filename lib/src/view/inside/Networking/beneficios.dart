import 'package:app_socios/src/models/usuario/empresa_model.dart';
import 'package:app_socios/utils/textFields/input_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../utils/list/lista-socios.dart';

class Beneficios_esta extends StatefulWidget {
  VoidCallback hide;
  VoidCallback show;
  Beneficios_esta({super.key, required this.hide, required this.show});

  @override
  State<Beneficios_esta> createState() => _Beneficios_estaState();
}

class _Beneficios_estaState extends State<Beneficios_esta> {
  final _searchController = TextEditingController();

  List<EmpresaModel> socios = [];
  List<EmpresaModel> cacheSocios = [];

  bool hasPermission = false;
  bool showSector = false;

  Future<void> getData() async {
    var data = await sociosLista;
    setState(() => socios = data.cast<EmpresaModel>());
    setState(() => cacheSocios = socios);

    @override
    void initState() {
      super.initState();
      getData();
    }

    @override
    Widget build(BuildContext context) {
      return Container();
    }
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
                setState(() => buildSearchList(value));
              },
              inputBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              icon: const Icon(Icons.search),
              placeHolder: "Buscar",
              nombreCampo: "Buscar Establecimiento ",
              accionCampo: TextInputAction.done),
          Expanded(
              child: cacheSocios.isEmpty
                  ? SingleChildScrollView(
                      child: Column(
                      children: [
                        SizedBox(
                          child: Image.asset("assets/nesec-logo.png"),
                        ),
                      ],
                    ))
                  : ListView.builder(
                      itemCount: cacheSocios.length,
                      itemBuilder: (context, index) {
                        String initial = "";
                        if (cacheSocios[index].razon_social != "") {
                          initial =
                              cacheSocios[index].razon_social.split("")[0];
                          return Slidable(
                            key: UniqueKey(),
                            startActionPane: ActionPane(
                                motion: const ScrollMotion(), children: []),
                            child: InkWell(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 20, right: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade800,
                                                blurRadius: 1.1,
                                                offset: const Offset(0, 0),
                                                spreadRadius: 0.5)
                                          ],
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Text(
                                        initial,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              margin: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                //"${contacts[index].nombres.split(" ")[0]} ${contacts[index].nombres.split(" ")[2]}",
                                                // "${cacheContacts[index].nombres.split(" ")[0]} ${cacheContacts[index].nombres.split(" ")[2] ?? ""}",
                                                getNameEmpresa(
                                                    cacheSocios[index]
                                                        .razon_social
                                                        .toUpperCase()),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            if (showSector)
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15),
                                                width: double.infinity,
                                                child: Text(
                                                  cacheSocios[index]
                                                          .tipo_empresa ??
                                                      "",
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                              )
                                          ],
                                        )),
                                    const Icon(Icons.navigate_next_outlined)
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }))
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

  List<EmpresaModel> buildSearchList(String value) {
    List<EmpresaModel> sociosLista = [];

    if (value.isNotEmpty) {
      setState(() => showSector = true);
      var filter = socios
          .where((e) =>
              (e.razon_social.toLowerCase().contains(value.toLowerCase())) ||
              (e.ruc!.toLowerCase().contains(value.toLowerCase())))
          .toList();

      setState(() => sociosLista = filter);
      setState(() => cacheSocios = sociosLista);
    } else {
      setState(() => showSector = false);
      setState(() => cacheSocios = socios);
      setState(() => socios = socios);
    }

    return sociosLista;
  }
}
