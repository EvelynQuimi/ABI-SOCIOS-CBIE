import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:app_socios/utils/responsive.dart';
import 'package:floating_pullup_card/floating_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class Tarjeta_v extends StatefulWidget {
  GlobalKey<ScaffoldState> sckey;
  Tarjeta_v({super.key, required this.sckey});

  @override
  State<Tarjeta_v> createState() => _Tarjeta_vState();
}

class _Tarjeta_vState extends State<Tarjeta_v> with TickerProviderStateMixin {
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
                    Icon(Abi_socios.tarjeta_icono),
                    SizedBox(width: 10),
                    Text("Mi Tarjeta Virtual",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black))
                  ],
                ),
                )
          ];
        },
        body: FloatingPullUpCardLayout(
          child: Container(
            height: Responsive.of(context).hp(38),
            width: double.infinity,
            child: Image.asset(
              "assets/tarjeta-virtual.png",
              fit: BoxFit.scaleDown,
            ),
          ),
          body: Container(
            height: Responsive.of(context).hp(10),
            width: double.infinity,
            child: Image.asset(
              "assets/minicard.png",
              fit: BoxFit.scaleDown,
            ),
          ),
        ));
  }
}
