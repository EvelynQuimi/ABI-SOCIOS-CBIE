import 'package:app_socios/utils/deviders/divider.dart';
import 'package:flutter/material.dart';


Widget footerBaadal() => Column(
      children: [
        divider(true),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 60,
          child: Image.asset("assets/byBaadal.png"),
        ),
        //const SizedBox(height: 10)
      ],
    );
