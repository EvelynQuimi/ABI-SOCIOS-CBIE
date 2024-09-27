import 'package:app_socios/src/view/inside/Home/Notificaciones/Notificaciones.dart';
import 'package:app_socios/src/view/inside/Home/lateralMenu/drawer_menu.dart';
import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/widget/tabBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:app_socios/src/view/inside/Home/home_screen.dart';
import 'package:app_socios/src/view/inside/Home/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final _sckey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  late MyAppBar appBar;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 1);
    appBar = MyAppBar(key: _sckey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawerMenu(context), //Dar funcion al icono de menú
        key: _sckey,
        body: menu());
  }

  Widget menu() {
    return Column(
      children: [
        Expanded(
          child: tabview(tabController, key: _sckey),
        ),
        tabBarBottom(
          controlador: tabController,
        ),
      ],
    );
  }
}

text(String s, {required TextStyle style}) {}
