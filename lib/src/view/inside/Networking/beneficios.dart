import 'package:app_socios/src/models/networkingModel/establecimiento_model.dart';
import 'package:app_socios/src/models/networkingModel/empresa_model.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/src/view/inside/Networking/data_list_estab.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_socios/utils/flushBarGlobal.dart';
import 'package:app_socios/utils/textFields/input_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../utils/list/lista-socios.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

import '../../../../utils/responsive.dart';

class Beneficios_esta extends StatefulWidget {
  VoidCallback hide;
  VoidCallback show;
  VoidCallback hidesearchb;
  VoidCallback showsearch;
  Beneficios_esta(
      {super.key,
      required this.hide,
      required this.show,
      required this.hidesearchb,
      required this.showsearch});

  @override
  State<Beneficios_esta> createState() => _Beneficios_estaState();
}

class _Beneficios_estaState extends State<Beneficios_esta> {
  bool loading = false;
  List<EstablecimientoModel> subcategoriasFilter = [];
  List<EstablecimientoModel> backupSubCat = [];

  double? longitude;
  double? latitude;

  bool showDetail = false;
  EstablecimientoModel? establecimiento;

  final _searchController = TextEditingController();
  String searchText = "";

  @override
  void initState() {
    super.initState();
    newDataFiltering();
  }

  void newDataFiltering() {
    for (var i = 0; i < listaCategorias.length; i++) {
      if (listaCategorias[i].subcategorias != null) {
        for (var x = 0; x < listaCategorias[i].subcategorias.length; x++) {
          subcategoriasFilter.add(listaCategorias[i].subcategorias[x]);
          backupSubCat.add(listaCategorias[i].subcategorias[x]);
          debugPrint("longitud de sub categorias: ${backupSubCat.length}");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return /*loading
        ? builderLoadingData()
        : */
        Column(
      children: [
        const SizedBox(height: 10),
        Container(
          child: InputTextFields(
              controlador: _searchController,
              inputBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              placeHolder: "Buscar",
              nombreCampo: "Busqueda establecimiento",
              //accionCampo: TextInputAction.done,
              onChanged: (value) {
                setState(() => searchText = value);
                buildSearch();
              },
              icon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        buildSearch();
                        setState(() => _searchController.clear());
                      },
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      )),
              accionCampo: TextInputAction.done),
        ),
        Expanded(
          child: showDetail
              ? detallesbeneficios(establecimiento: establecimiento!)
              : _searchController.text.isEmpty //_searchController.text.isEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: loading ? 5 : listaCategorias.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              showDetail = true;

                              loading = true;
                            });
                            widget.hidesearchb();
                          },
                          child: Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.width >
                                                  250
                                              ? 200
                                              : 100,
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 150,
                                        child: Image.asset(
                                          listaCategorias[i].fotoCategoria != ""
                                              ? listaCategorias[i]
                                                  .fotoCategoria!
                                              : "assets/banner-salud",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Stack(children: [
                                      listaCategorias[i].subcategorias.length ==
                                              1
                                          ? SizedBox(
                                              width: double.infinity,
                                              height: 150,
                                              /* MediaQuery.of(context)
                                                            .size
                                                            .width >
                                                        450
                                                     200 */
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.asset(
                                                  listaCategorias[i]
                                                              .subcategorias[0]
                                                              .fotoCompraSubCategoria !=
                                                          ''
                                                      ? listaCategorias[i]
                                                          .subcategorias[0]
                                                          .fotoCompraSubCategoria
                                                      : "assets/no_image_otros.jpeg",
                                                  fit: BoxFit.fill,
                                                  height: 100,
                                                  width: 100,
                                                ),
                                              ))
                                          : SizedBox(
                                              height:
                                                  185, //Todo tamaño de contenedor de carrusel
                                              child: Swiper(
                                                viewportFraction: 0.35,
                                                scale: 0.85,
                                                autoplay: false,
                                                autoplayDelay: 3000,
                                                pagination:
                                                    const SwiperPagination(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  builder:
                                                      DotSwiperPaginationBuilder(
                                                          space: 5.0,
                                                          color: Colors.white,
                                                          activeColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  247,
                                                                  101,
                                                                  28),
                                                          size: 8),
                                                  margin:
                                                      EdgeInsets.only(top: 50),
                                                ),
                                                itemCount: listaCategorias[i]
                                                    .subcategorias
                                                    .length,
                                                loop: true,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () async {
                                                      //valido que el usuario tena permisosde ubicació
                                                      if (await Permission
                                                          .location
                                                          .status
                                                          .isGranted) {
                                                        //complemento que me permite obtener mi ubicación actual
                                                        obtenerUbicacion();
                                                      } else {
                                                        //sino tiene permiso, se lo pide
                                                        var status =
                                                            await Permission
                                                                .location
                                                                .request();

                                                        if (status.isGranted) {
                                                          obtenerUbicacion();
                                                        } else {
                                                          scaffoldMessenger(
                                                              context,
                                                              "Usuario rechazó el permiso de ubicación",
                                                              Icon(Icons.error,
                                                                  color: Colors
                                                                      .red));
                                                        }
                                                      }

                                                      setState(() {
                                                        showDetail = true;

                                                        loading = true;
                                                        establecimiento =
                                                            listaCategorias[i]
                                                                    .subcategorias[
                                                                index];
                                                      });
                                                      widget.hidesearchb();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      height: 15,
                                                      child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: ClipRRect(
                                                                child:
                                                                    Image.asset(
                                                                  listaCategorias[i]
                                                                              .subcategorias[
                                                                                  index]
                                                                              .fotoCompraSubCategoria !=
                                                                          ''
                                                                      ? listaCategorias[
                                                                              i]
                                                                          .subcategorias[
                                                                              index]
                                                                          .fotoCompraSubCategoria
                                                                      : "assets/no_image_otros.jpeg",
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  height: 50,
                                                                  width:
                                                                      80, //Todo tamaño de los iconos
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10.0), // Todo Espaciado entre la imagen y el texto
                                                                child: Center(
                                                                    child: Text(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        /*  "Descripción de beneficios" */ listaCategorias[i]
                                                                            .subcategorias[
                                                                                index]
                                                                            .descripcion_completa_ben, // Asegúrate de que este campo exista
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color: const Color
                                                                              .fromARGB(
                                                                              223,
                                                                              101,
                                                                              101,
                                                                              101), // Todo color de texto

                                                                          // Cambia el color según tus preferencias
                                                                        ))),
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ); //return
                                                },
                                              ))
                                    ]),
                                  ),
                                ],
                              )),
                        );
                      })
                  : GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: subcategoriasFilter.length,
                      itemBuilder: (context, i) {
                        return SizedBox(
                          // height: 50,
                          child: Stack(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                subcategoriasFilter[i].fotoCompraSubCategoria !=
                                        ''
                                    ? subcategoriasFilter[i]
                                        .fotoCompraSubCategoria
                                    : "assets/no_image_otros.jpeg",
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 0.67,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                    ),
        ),
        SizedBox(height: 15)
      ],
    );
  }

  void obtenerUbicacion() async {
    final loc = await Geolocator.getCurrentPosition();
    //seteo la latitud y longitud
    setState(() {
      latitude = loc.latitude;
      longitude = loc.longitude;
    });
  }

  Widget detallesbeneficios({required EstablecimientoModel establecimiento}) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
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
            SizedBox(height: 25),
            Image.asset(
              establecimiento.fotoCompraSubCategoria,
              fit: BoxFit.contain,
              width: 280,
              height: 105,
            ),
            //SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.all(25.5),
              child: Text(establecimiento.descripcionesta,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(establecimiento.descripcion_completa_ben,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),

            Container(
              // Widget del mapa
              height: 230, // Ajusta la altura según sea necesario
              width: double.infinity,

              child: GoogleMap(
                mapType: MapType.satellite,
                mapToolbarEnabled: false,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(establecimiento.sucursales[0].latitud,
                      establecimiento.sucursales[0].longitud),
                  zoom: 30, // Ajusta el nivel de zoom según sea necesario
                ),
                markers: {
                  if (establecimiento.sucursales.isNotEmpty)
                    for (var sucursal in establecimiento.sucursales)
                      Marker(
                        //
                        // icon: BitmapDescriptor.defaultMarkerWithHue(1),
                        markerId: MarkerId(sucursal.nsucursal),
                        position: LatLng(sucursal.latitud, sucursal.longitud),
                        infoWindow: InfoWindow(
                          title: 'Ubicación',
                          snippet:
                              sucursal.nsucursal, // Reemplaza con el nombre
                        ),
                      )
                  else if (latitude != null && longitude != null)
                    Marker(
                      // icon: BitmapDescriptor.defaultMarkerWithHue(1),
                      markerId: MarkerId('Mi ubicación'),
                      position: LatLng(latitude!, longitude!),
                      infoWindow: InfoWindow(
                        title: 'Ubicación',
                        snippet: establecimiento
                            .nombreCompraSubCategoria, // Reemplaza con el nombre
                      ),
                    ),
                },
              ),
            ),

            SizedBox(height: 20), // Espacio adicional si lo deseas
          ],
        ),
      ),
    );
  }

  Widget builderLoadingData() {
    final rsp = Responsive.of(context);
    return GestureDetector(
      onTap: () => setState(() => loading = false),
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            CardLoading(
              animationDuration: Duration(milliseconds: 1200),
              borderRadius: BorderRadius.circular(10),
              height: MediaQuery.of(context).size.width > 250 ? 100 : 50,
              width: double.infinity,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 200,
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                children: [
                  CardLoading(
                    margin: EdgeInsets.only(top: 7, bottom: 7),
                    animationDuration: const Duration(milliseconds: 1200),
                    borderRadius: BorderRadius.circular(10),
                    height: 200,
                    width: rsp.wp(32),
                  ),
                  CardLoading(
                    borderRadius: BorderRadius.circular(10),
                    animationDuration: const Duration(milliseconds: 1200),
                    height: 200,
                    width: rsp.wp(32),
                  ),
                  CardLoading(
                    margin: EdgeInsets.only(top: 7, bottom: 7),
                    animationDuration: const Duration(milliseconds: 1200),
                    borderRadius: BorderRadius.circular(10),
                    height: 200,
                    width: rsp.wp(32),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            CardLoading(
              animationDuration: Duration(milliseconds: 1200),
              borderRadius: BorderRadius.circular(10),
              height: MediaQuery.of(context).size.width > 250 ? 100 : 50,
              width: double.infinity,
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 200,
              child: GridView(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                children: [
                  CardLoading(
                    borderRadius: BorderRadius.circular(10),
                    animationDuration: const Duration(milliseconds: 1200),
                    height: 200,
                    width: rsp.wp(32),
                  ),
                  CardLoading(
                    borderRadius: BorderRadius.circular(10),
                    animationDuration: const Duration(milliseconds: 1200),
                    height: 200,
                    width: rsp.wp(32),
                  ),
                  CardLoading(
                    borderRadius: BorderRadius.circular(10),
                    animationDuration: const Duration(milliseconds: 1200),
                    height: 200,
                    width: rsp.wp(32),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<EstablecimientoModel> buildSearch() {
    if (searchText.isEmpty) {
      return subcategoriasFilter = backupSubCat;
    } else {
      subcategoriasFilter = backupSubCat
          .where((element) => element.nombreCompraSubCategoria
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();

      debugPrint("LONGITUD SEARCH: ${subcategoriasFilter.length}");
      return subcategoriasFilter;
    }
  }
}
