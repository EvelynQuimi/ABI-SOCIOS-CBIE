import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:app_socios/utils/responsive.dart';
import 'package:flutter/material.dart';

class B_Emergencia extends StatefulWidget {
  GlobalKey<ScaffoldState> sckey;
  B_Emergencia({super.key, required this.sckey});

  @override
  State<B_Emergencia> createState() => _B_EmergenciaState();
}

class _B_EmergenciaState extends State<B_Emergencia>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late MyAppBar appBar;

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 2, vsync: this);
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
                  Icon(
                    Abi_socios.emergencia_icono,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5),
                  Text("Botón de Emergencia",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black))
                ],
              ))
        ];
      },
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: Responsive.of(context).hp(35),
          width: double.infinity,
          child: Image.asset(
            "assets/boton-emergencia.png",
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
