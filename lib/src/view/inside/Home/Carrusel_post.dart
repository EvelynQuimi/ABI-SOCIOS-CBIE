import 'package:app_socios/Carrusel.dart';
import 'package:app_socios/main.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/sliders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class CarruselPost extends StatefulWidget {
  GlobalKey<ScaffoldState> sckey;
  CarruselPost({super.key, required this.sckey});

  @override
  _CarruselPostState createState() => _CarruselPostState();
}

class _CarruselPostState extends State<CarruselPost>
    with TickerProviderStateMixin {
  int _current = 0;
  late MyAppBar appBar;

  @override
  void initState() {
    super.initState();
    appBar = MyAppBar(key: widget.sckey);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, val) {
        return [
          appBar.mySliverAppBar(context,
              widgethide: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 7),
                  Text(
                    "Feed",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                  )
                ],
              ))
        ];
      },
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            //todo carrusel de posts de usuarios
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    //foto de perfil
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Nombre de usuario',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )),
            //post
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          onPageChanged:
                              (int index, CarouselPageChangedReason reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: sliders.asMap().entries.map((entry) {
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
                                            243, 233, 121, 35))
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4),
                              ),
                            );
                          }).toList(),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite_border_outlined,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: "Nombre de Usuario: ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(text: "Comentarios..."),
                              ]))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //me gusta-comentarios
            /* Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ],
            ),
          )*/
          ],
        ),
      ),
    );
  }
}
