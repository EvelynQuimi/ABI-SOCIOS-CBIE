import 'package:app_socios/utils/app_bar.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:app_socios/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Nesec extends StatefulWidget {
  GlobalKey<ScaffoldState> sckey;
  Nesec({super.key, required this.sckey});

  @override
  State<Nesec> createState() => _NesecState();
}

class _NesecState extends State<Nesec> with TickerProviderStateMixin {
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
    return Container(
      child: Image.asset("assets/nesec-logo.png"),
    );
  }
}
