import 'package:app_socios/src/view/inside/Home/lateralMenu/drawer_menu.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/mi_perfil/form_contactos.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:flutter/material.dart';

class MisDatos extends StatefulWidget {
  MisDatos({super.key});

  @override
  State<MisDatos> createState() => _MisDatosState();
}

class _MisDatosState extends State<MisDatos> with TickerProviderStateMixin {
  final keydatos = GlobalKey<ScaffoldState>();
  late final TabController _tabControllerdatos;
  late MyAppBar appBar;

  @override
  void initState() {
    super.initState();
    _tabControllerdatos = TabController(length: 3, vsync: this);
    appBar = MyAppBar(key: keydatos);
  }

  @override
  void dispose() {
    _tabControllerdatos.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //El titulo de las vistas
    return Scaffold(
        key: keydatos,
        drawer: drawerMenu(context),
        body: NestedScrollView(
            headerSliverBuilder: (context, val) {
              return [
                appBar.mySliverAppBar(context,
                    widgethide: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 5),
                        Text("Mis datos")
                      ],
                    ))
              ];
            },
            body: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                height: 30,
                child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  controller: _tabControllerdatos,
                  tabs: const <Widget>[
                    Tab(
                      text: ("Representante Legal"),
                    ),
                    Tab(
                      text: ("Empresa"),
                    ),
                    Tab(
                      text: ("Otros contactos"),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(controller: _tabControllerdatos, children: [
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: const Color.fromARGB(255, 79, 95, 78),
                ),
                Container(
                  color: const Color.fromARGB(255, 97, 218, 93),
                ),
                //Formcontactos(key:),
              ]))
            ])));
  }
}
