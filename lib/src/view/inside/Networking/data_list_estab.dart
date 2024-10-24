import 'package:app_socios/src/models/networkingModel/establecimiento_model.dart';
import 'package:app_socios/src/models/networkingModel/sucursales_model.dart';

List<CategoriasModelo> listaCategorias = [
  //todo CRÉDITOS
  CategoriasModelo(
    fotoCategoria: "assets/banner-salud.png",
    idCompraCategoria: 1,
    nombreCompraCategoria: "Salud",
    subcategorias: [
      EstablecimientoModel(
          fotoCompraSubCategoria: "assets/saludsa-logo.png",
          idCategoria: 1,
          idCompraSubCategoria: 1,
          nombreCompraSubCategoria: "Saludsa",
          descripcion_completa_ben: "Descuento 15%",
          latitud: "37.4194",
          longitud: "-122.4194",
          descripcionesta:
              "Hoy somos la empresa líder en Medicina Prepagada, donde nuestro talento está enfocado a satisfacer las necesidades de nuestros clientes y promover un estilo de vida saludable.",
          sucursales: [
            SucursalesModel(
                latitud: -2.165764860474399,
                longitud: -79.91965093410916,
                nsucursal: "Salud S.A Guayaquil",
                direccion: "Av. Pdte. Carlos Julio Arosemena Tola Km. 3"),
            SucursalesModel(
                latitud: -0.1891996530327101,
                longitud: -78.482609803652,
                nsucursal: "Salud S.A Quito",
                direccion: "Av.Eloy Alfavor y Av. Los Shyris"),
          ]),
      EstablecimientoModel(
          fotoCompraSubCategoria: "assets/semedic-logo.png",
          idCategoria: 1,
          idCompraSubCategoria: 2,
          nombreCompraSubCategoria: "Semedic",
          descripcion_completa_ben:
              "15% de Descuento en pagos con tarjeta de crédito",
          longitud: "-2.170922",
          latitud: "-79.918369",
          descripcionesta:
              "Somos un equipo de profesionales de la salud prestos al servicio de nuestros pacientes en cada uno de los Centros Médicos con los que tenemos a disposición.",
          sucursales: [
            SucursalesModel(
                latitud: -2.174821270434457,
                longitud: -79.89684496135314,
                nsucursal: "Semedic Kennedy",
                direccion: "Av del Periodista 312"),
            SucursalesModel(
                latitud: -2.161269729494717,
                longitud: -79.91349611408741,
                nsucursal: "Semedic Urdesa",
                direccion: "Av. Dr. Jorge Perez Concha 905"),
            SucursalesModel(
                latitud: -2.2118545515672943,
                longitud: -79.89001843997987,
                nsucursal: "Semedic Centro",
                direccion: "Bolivia &, Guayaquil 090101"),
            SucursalesModel(
                latitud: -2.2424004074404658,
                longitud: -79.9004627848733,
                nsucursal: "Semedic Sur",
                direccion: "Padre Cayetano Tarruel"),
          ]),
      EstablecimientoModel(
          fotoCompraSubCategoria: "assets/farmaenlace.png",
          idCategoria: 1,
          idCompraSubCategoria: 3,
          nombreCompraSubCategoria: "FarmaEnlace",
          descripcion_completa_ben: "15% de descuento",
          longitud: "-2.170922",
          latitud: "-79.918369",
          descripcionesta:
              "Nos consideramos competentes para satisfacer continuamente las expectativas de nuestros clientes internos y externos, con actitud, agilidad y anticipándonos a sus necesidades.",
          sucursales: [
            SucursalesModel(
                latitud: -2.151440493648193,
                longitud: -79.90539721898341,
                nsucursal: "FarmaEnlace Guayaquil",
                direccion: "Av. Rodrigo Chavez 274"),
            SucursalesModel(
                latitud: -0.1806802813642517,
                longitud: -78.4757846245332,
                nsucursal: "FarmaEnlace Quito",
                direccion: "RG9F+5H8, Av. Portugal"),
          ]),
    ],
  ),
  //todo SEEGUROS
  CategoriasModelo(
    fotoCategoria: "assets/decoracion.png",
    idCompraCategoria: 2,
    nombreCompraCategoria: "Decoración",
    subcategorias: [
      EstablecimientoModel(
          fotoCompraSubCategoria: "assets/decoracion.png",
          idCategoria: 2,
          idCompraSubCategoria: 3,
          nombreCompraSubCategoria: "Decoración",
          descripcion_completa_ben: "Categoria de decoración ",
          longitud: "-122.4194",
          latitud: "37.4194",
          descripcionesta: "",
          sucursales: [
            SucursalesModel(
                latitud: -2.174821270434457,
                longitud: -79.89684496135314,
                nsucursal: "Semedic Kennedy",
                direccion: "Av del Periodista 312"),
            SucursalesModel(
                latitud: -2.161269729494717,
                longitud: -79.91349611408741,
                nsucursal: "Semedic Urdesa",
                direccion: "Av. Dr. Jorge Perez Concha 905"),
            SucursalesModel(
                latitud: -2.2118545515672943,
                longitud: -79.89001843997987,
                nsucursal: "Semedic Centro",
                direccion: "Bolivia &, Guayaquil 090101"),
            SucursalesModel(
                latitud: -2.2424004074404658,
                longitud: -79.9004627848733,
                nsucursal: "Semedic Sur",
                direccion: "Padre Cayetano Tarruel"),
          ]),
    ],
  ),
  //todo decoracion
  CategoriasModelo(
      fotoCategoria: "assets/decoracion.png",
      idCompraCategoria: 3,
      nombreCompraCategoria: "Decoración",
      subcategorias: [
        EstablecimientoModel(
            fotoCompraSubCategoria: "assets/decoracion.png",
            idCategoria: 3,
            idCompraSubCategoria: 4,
            nombreCompraSubCategoria: "Decoración",
            descripcion_completa_ben: "Categoria de Decoración",
            longitud: "-2.170922",
            latitud: "-79.918369",
            descripcionesta: "",
            sucursales: [
              SucursalesModel(
                  latitud: -2.174821270434457,
                  longitud: -79.89684496135314,
                  nsucursal: "Semedic Kennedy",
                  direccion: "Av del Periodista 312"),
              SucursalesModel(
                  latitud: -2.161269729494717,
                  longitud: -79.91349611408741,
                  nsucursal: "Semedic Urdesa",
                  direccion: "Av. Dr. Jorge Perez Concha 905"),
              SucursalesModel(
                  latitud: -2.2118545515672943,
                  longitud: -79.89001843997987,
                  nsucursal: "Semedic Centro",
                  direccion: "Bolivia &, Guayaquil 090101"),
              SucursalesModel(
                  latitud: -2.2424004074404658,
                  longitud: -79.9004627848733,
                  nsucursal: "Semedic Sur",
                  direccion: "Padre Cayetano Tarruel"),
            ]),
      ])
];
