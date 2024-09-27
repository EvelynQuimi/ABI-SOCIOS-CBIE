import 'package:flutter/material.dart';

Future<void> scaffoldMessenger(BuildContext context, String title, Icon? icon,
    {int? seconds, Widget? trailing}) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: seconds ?? 3),
      content: Row(
        children: [
          icon ?? const Icon(Icons.warning, color: Colors.yellow),
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
          trailing ?? Container()
        ],
      ),
      //backgroundColor: Colors.black,
      showCloseIcon: trailing != null ? false : true,
      closeIconColor: Colors.white));
}
