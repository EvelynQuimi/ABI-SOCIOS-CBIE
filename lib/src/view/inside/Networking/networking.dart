import 'package:app_socios/src/view/inside/Networking/beneficios.dart';
import 'package:app_socios/src/view/inside/Networking/socios.dart';
import 'package:app_socios/utils/app_bar.dart';
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
                    Icon(Icons.group),
                    SizedBox(width: 5),
                    Text("Networking")
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
                    icon: Icon(Icons.groups),
                    text: ("SOCIOS"),
                  ),
                  Tab(
                    icon: Icon(Icons.star_rate),
                    text: ("BENEFICIOS"),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Socios(),
                  Beneficios_esta(),
                ]),
              )
            ])));
  }
}
