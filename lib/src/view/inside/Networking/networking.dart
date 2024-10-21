import 'package:app_socios/src/view/inside/Networking/beneficios.dart';
import 'package:app_socios/src/view/inside/Networking/socios.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:app_socios/widget/tabBar_widget.dart';
import 'package:flutter/material.dart';

class TabBarNetworking extends StatefulWidget {
  GlobalKey<ScaffoldState> sckey;
  TabBarNetworking({super.key, required this.sckey});

  @override
  State<TabBarNetworking> createState() => _TabBarNetworkingState();
}

class _TabBarNetworkingState extends State<TabBarNetworking>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late MyAppBar appBar;
  bool? hideb;
  bool? hidesearch;

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

  void hide() {
    setState(() {
      hideb = false;
    });
  }

  void show() {
    setState(() {
      hideb = true;
    });
  }

  void hidesearchb() {
    setState(() {
      hidesearch = false;
    });
  }

  void showsearch() {
    setState(() {
      hidesearch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //El titulo de las vistas
    return NestedScrollView(
        headerSliverBuilder: (context, val) {
          return [
            appBar.mySliverAppBar(context,
                hide: hideb,
                widgethide: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Abi_socios.networking_icono, color: Colors.black),
                      SizedBox(width: 10),
                      Text("Networking",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black))
                    ])
                  ],
                ))
          ];
        },
        body: Container(
            color: Colors.white,
            child: Column(children: [
              TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(
                    icon: Icon(Abi_socios.networking_icono),
                    text: ("SOCIOS"),
                  ),
                  Tab(
                    icon: Icon(Abi_socios.beneficio_icono),
                    text: ("BENEFICIOS"),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Socios(
                    hide: hide,
                    show: show,
                    hidesearchb: hidesearchb,
                    showsearch: showsearch,
                  ),
                  Beneficios_esta(
                    hide: hide,
                    show: show,
                  ),
                ]),
              )
            ])));
  }
}
