import 'package:app_socios/src/view/inside/Home/Carrusel_post.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/global.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:app_socios/utils/responsive.dart';
import 'package:app_socios/utils/sliders.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Eventos extends StatefulWidget {
  GlobalKey<ScaffoldState> sckey;
  Eventos({super.key, required this.sckey});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _current = 0;
  late MyAppBar appBar;
  List map = [];
  List<Widget> newSlides = [];

  void inicializarListaSlide() {
    var list = List.generate(
      3,
      (i) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.primaries[i % Colors.primaries.length],
            child: Text("posicion ${i + 1}"),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: "Fecha del evento:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(text: "${16 + i}/08/2024"),
                    ])),
              ),
              Container(
                  padding: EdgeInsets.all(0.3),
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                            text: "Dirección:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(text: "Descripcion $i "),
                      ]))),
            ],
          ),
        ],
      ),
    );

    setState(() {
      newSlides = list;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    appBar = MyAppBar(key: widget.sckey);
    //maxItemsToPost = map.length;
    Future.delayed(const Duration(milliseconds: 100))
        .then((_) => inicializarListaSlide());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //El titulo de las vistas
    return NestedScrollView(
      headerSliverBuilder: (context, val) {
        return [
          appBar.mySliverAppBar(context,
              mostrar: true,
              widgethide: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Abi_socios.agenda_icono, color: Colors.black),
                  SizedBox(width: 5),
                  Text(
                    "Eventos",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ],
              ))
        ];
      },
      body: Container(
        color: Colors.white,
        child:
            //todo carrusel de posts de usuarios
            Padding(
          padding: const EdgeInsets.only(left: 10),
          child:
              //post
              Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Expanded(
                  child: CarouselSlider.builder(
                    itemCount: newSlides.length,
                    options: CarouselOptions(
                      disableCenter: true,
                      onPageChanged: (index, _) =>
                          setState(() => _current = index),
                      autoPlay: false,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    itemBuilder: (context, index, page) {
                      return newSlides[index];
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: newSlides.asMap().entries.map((entry) {
                    return GestureDetector(
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : const Color.fromARGB(227, 233, 121, 35))
                                .withOpacity(
                                    _current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                /*Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                        text: "Fecha del evento:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    TextSpan(text: "16/08/2024"),
                                  ]))
                            ],
                          ),
                        )/
                        Container(
                          padding: EdgeInsets.all(0.3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                    TextSpan(
                                        text: "Dirección:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                    TextSpan(text: "Edificio de camara de "),
                                  ]))
                            ],
                          ),
                        ),*/
              ],
            ),
          ),
        ),
      ),
      /* Container(
                child: Row(
                  children: <Widget>[
                    text("Fecha de Evento:", style: TextStyle())
                  ],
                ),
              )*/
    );
  }
}
