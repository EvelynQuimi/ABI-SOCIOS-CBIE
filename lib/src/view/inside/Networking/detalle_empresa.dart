import 'package:app_socios/utils/header_container.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:url_launcher/url_launcher.dart';

class EmpresaDetailPage extends StatelessWidget {
  final Map<String, dynamic> empresa;

  const EmpresaDetailPage({Key? key, required this.empresa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(children: [
        SizedBox(height: 35),
        Image.asset(
          empresa["asset"],
          fit: BoxFit.cover,
          width: 160,
          height: 160,
        ),
        SizedBox(height: 5),
        /* Text(
        ' ${empresa["razon_social"]}',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ), */
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
              empresa["descripcion"] ?? "No hay descripción disponible.",
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ),
        SizedBox(height: 3),
        Container(
          padding: EdgeInsets.all(3),
          color: const Color.fromARGB(
              255, 120, 120, 120), // Color gris del rectángulo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Presentación institucional',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end, // Alinear botones a la derecha
                    children: [
                      IconButton(
                        onPressed: () {
                          // Lógica para ver la presentación
                        },
                        icon: Row(
                          children: [
                            Icon(Abi_socios.descargarpresentacion_icono,
                                color: Colors.white),
                            SizedBox(width: 8),
                          ],
                        ),
                      ),
                      SizedBox(width: 10), // Espacio entre botones
                      IconButton(
                        onPressed: () {
                          // Lógica para descargar la presentación
                        },
                        icon: Row(
                          children: [
                            Icon(Abi_socios.verpresentacion_icono,
                                color: Colors.white),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(height: 5),
            HeaderContainer(
              height_container: 63,
              alignment_title: Alignment.centerLeft,
              has_header: true,
              has_title: true,
              body: Container(),
              title: Container(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 15, right: 15, top: 8),
                child: Text(
                  'Nombre del Socio:',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              header: Text(
                '${empresa["socio"] ?? "No disponible"}',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Column(children: [
              SizedBox(height: 5),
              HeaderContainer(
                height_container: 63,
                alignment_title: Alignment.centerLeft,
                has_header: true,
                has_title: true,
                body: Container(),
                title: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 8),
                  child: Text(
                    'Contacto Comercial: ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                header: Text(
                  '${empresa["socio"] ?? "No disponible"}',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ]),
            SizedBox(height: 20), // Espacio antes de los iconos
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Abi_socios.linkedin_icono,
                      size: 40,
                    ), // Aquí puedes usar tu icono de LinkedIn
                    onPressed: () => /* _launchURL */
                        (empresa["linkedin"] ?? ''),
                  ),
                  IconButton(
                    icon: Icon(Abi_socios.instagram_icono,
                        size: 40), // Aquí puedes usar tu icono de Instagram
                    onPressed: () => /* _launchURL */
                        (empresa["instagram"] ?? ''),
                  ),
                  IconButton(
                    icon: Icon(Abi_socios.website_icono,
                        size: 40), // Aquí puedes usar tu icono de sitio web
                    onPressed: () => /* _launchURL */
                        (empresa["sitio_web"] ?? ''),
                  ),
                  IconButton(
                    icon: Icon(Abi_socios.facebook_icono,
                        size: 40), // Aquí puedes usar tu icono de Facebook
                    onPressed: () => /* _launchURL */
                        (empresa["facebook"] ?? ''),
                  ),
                  IconButton(
                    icon: Icon(Abi_socios.x_icono,
                        size: 40), // Aquí puedes usar tu icono de X (Twitter)
                    onPressed: () => /* _launchURL */
                        (empresa["twitter"] ?? ''),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Espacio adicional
          ],
        ),
      ]),
    ));
  }
}
