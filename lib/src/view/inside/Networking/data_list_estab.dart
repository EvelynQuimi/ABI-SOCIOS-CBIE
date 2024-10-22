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
        altitud: "-2.170922",
        latitud: "-79.918369",
      ),
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/semedic-logo.png",
        idCategoria: 1,
        idCompraSubCategoria: 2,
        nombreCompraSubCategoria: "Semedic",
        descripcion_completa_ben:
            "15% de Descuento en pagos con tarjeta de crédito",
        altitud: "",
        latitud: "",
      ),
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/farmaenlace.png",
        idCategoria: 1,
        idCompraSubCategoria: 3,
        nombreCompraSubCategoria: "FarmaEnlace",
        descripcion_completa_ben: "15% de descuento",
        altitud: "",
        latitud: "",
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
        fotoCompraSubCategoria: "assets/banner-salud.png",
        idCategoria: 2,
        idCompraSubCategoria: 3,
        nombreCompraSubCategoria: "Salud",
        descripcion_completa_ben: "Categoria de salud ",
        altitud: "",
        latitud: "",
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
          altitud: "",
          latitud: "",
        ),
      ])
];
