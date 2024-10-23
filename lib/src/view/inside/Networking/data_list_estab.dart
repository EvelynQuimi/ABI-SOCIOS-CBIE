import 'package:app_socios/src/models/establecimiento_model.dart';

List<CategoriasModelo> listaCategorias = [
  //todo CRÉDITOS
  CategoriasModelo(
    fotoCategoria: "assets/banner-salud.png",
    idCompraCategoria: 1,
    nombreCompraCategoria: "Salud",
    subcategorias: [
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/saludsa-logo.png",
        idCategoria: 1,
        idCompraSubCategoria: 1,
        nombreCompraSubCategoria: "Saludsa",
        descripcion_completa_ben: "Descuento 15%",
        longitud: "-2.170922",
        latitud: "-79.918369",
        descripcionesta:
            "Hoy somos la empresa líder en Medicina Prepagada, donde nuestro talento está enfocado a satisfacer las necesidades de nuestros clientes y promover un estilo de vida saludable, por eso estamos convencidos de que en estos 29 años con cada Producto que ofrecemos, mejoramos su vida.",
      ),
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/semedic-logo.png",
        idCategoria: 1,
        idCompraSubCategoria: 2,
        nombreCompraSubCategoria: "Semedic",
        descripcion_completa_ben:
            "15% de Descuento en pagos con tarjeta de crédito",
        longitud: "",
        latitud: "",
        descripcionesta: "",
      ),
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/farmaenlace.png",
        idCategoria: 1,
        idCompraSubCategoria: 3,
        nombreCompraSubCategoria: "FarmaEnlace",
        descripcion_completa_ben: "15% de descuento",
        longitud: "",
        latitud: "",
        descripcionesta: "",
      ),
    ],
  ),
  //todo SEEGUROS
  CategoriasModelo(
    fotoCategoria: "assets/decoracion.png",
    idCompraCategoria: 2,
    nombreCompraCategoria: "Decoración",
    subcategorias: [
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/decoracion.png",
        idCategoria: 2,
        idCompraSubCategoria: 3,
        nombreCompraSubCategoria: "Decoración",
        descripcion_completa_ben: "Categoria de decoración ",
        longitud: "",
        latitud: "",
        descripcionesta: "",
      ),
    ],
  ),
  //todo decoracion
  CategoriasModelo(
      fotoCategoria: "assets/decoracion.png",
      idCompraCategoria: 3,
      nombreCompraCategoria: "Decoración",
      subcategorias: [
        SubCategoriaModelo(
          fotoCompraSubCategoria: "assets/decoracion.png",
          idCategoria: 3,
          idCompraSubCategoria: 4,
          nombreCompraSubCategoria: "Decoración",
          descripcion_completa_ben: "Categoria de Decoración",
          longitud: "",
          latitud: "",
          descripcionesta: "",
        ),
      ])
];
