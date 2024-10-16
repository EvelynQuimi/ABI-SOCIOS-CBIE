import 'package:app_socios/src/view/inside/Home/lateralMenu/drawer_menu.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/mi_perfil/form_contactos.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/mi_perfil/form_empresa.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/mi_perfil/form_rep_leg.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:flutter/material.dart';

class MisDatos extends StatefulWidget {
  MisDatos({super.key});

  @override
  State<MisDatos> createState() => _MisDatosState();
}

class _MisDatosState extends State<MisDatos> 
with TickerProviderStateMixin {
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
                        Icon(Abi_socios.misdatos_icono, size: 15),
                        SizedBox(width: 5),
                        Text("Mis datos")
                      ],
                    ))
              ];
            },
            body: Column(children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Logo-bg.png'), // Cambia la ruta según sea necesario
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
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
                PersonaForm(),

                FormEmpresa(),

                Formcontactos(),
                //Formcontactos(key:),
              ]))
            ])));
  }
}
