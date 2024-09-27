import 'package:app_socios/utils/app_bar.dart';
import 'package:flutter/material.dart';

class Formcontactos extends StatefulWidget {
  GlobalKey<ScaffoldState> sckey;
  Formcontactos({super.key, required this.sckey});

  @override
  State<Formcontactos> createState() => _FormcontactosState();
}

class _FormcontactosState extends State<Formcontactos>
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
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Column(children: [
              TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(
                    text: ("Contacto comercial"),
                  ),
                  Tab(
                    text: ("Contacto para pagos"),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Container(color: Colors.white),
                  Container(
                    color: Colors.blue,
                  ),
                ]),
              )
            ])));
  }
}
