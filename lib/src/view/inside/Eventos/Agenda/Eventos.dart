import 'package:app_socios/src/view/inside/Home/Carrusel_post.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/sliders.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    appBar = MyAppBar(key: widget.sckey);
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
                widgethide: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 5),
                    Text("Eventos")
                  ],
                ))
          ];
        },
        body: Container(
            color: Colors.white,
            child: Column(children: [
              //todo carrusel de posts de usuarios
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child:
                    //post
                    Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10),
                        FlutterCarousel(
                          items: sliders,
                          options: FlutterCarouselOptions(
                              autoPlay: false,
                              viewportFraction: 1.0,
                              initialPage: _current,
                              showIndicator: false,

                              ///height: 350,
                              onPageChanged: (int index,
                                  CarouselPageChangedReason reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: slides.asMap().entries.map((entry) {
                                return Container(
                                  width: 12.0,
                                  height: 12.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color.fromARGB(
                                                255, 139, 139, 139)
                                            : const Color.fromARGB(
                                                227, 233, 121, 35))
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
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
            ])));
  }
}
