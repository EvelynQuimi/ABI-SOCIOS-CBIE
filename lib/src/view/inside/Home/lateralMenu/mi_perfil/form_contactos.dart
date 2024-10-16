import 'package:app_socios/src/view/inside/Home/lateralMenu/mi_perfil/form_contact_comer.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:flutter/material.dart';

class Formcontactos extends StatefulWidget {
  //GlobalKey<ScaffoldState> sckey;
  Formcontactos({super.key});

  @override
  State<Formcontactos> createState() => _FormcontactosState();
}

class _FormcontactosState extends State<Formcontactos>
    with TickerProviderStateMixin {
  final keydatoscontact = GlobalKey<ScaffoldState>();
  late final TabController _tabController;
  late MyAppBar appBar;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    appBar = MyAppBar(key: keydatoscontact);
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
                indicator: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
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
                  ContacomercialForm(),
                  Container(
                    color: Colors.blue,
                  ),
                ]),
              )
            ])));
  }
}
