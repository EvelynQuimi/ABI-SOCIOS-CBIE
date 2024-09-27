import 'package:app_socios/utils/app_bar.dart';
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
                    Icon(Icons.emergency),
                    SizedBox(width: 5),
                    Text("Botón de Emergencia")
                  ],
                ))
          ];
        },
        body: Container(
          color: Colors.white,
        )
        //Expanded(child: Image.asset('assets/icons/social.png')),
        );
  }
}
