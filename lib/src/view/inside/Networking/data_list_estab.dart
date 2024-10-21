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
        nombreCompraSubCategoria: "Semedic",
      ),
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/semedic-logo.png",
        idCategoria: 1,
        idCompraSubCategoria: 2,
        nombreCompraSubCategoria: "Semedic",
      ),
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/farmaenlace.png",
        idCategoria: 1,
        idCompraSubCategoria: 3,
        nombreCompraSubCategoria: "Semedic",
      ),
    ],
  ),
  //todo SEEGUROS
  CategoriasModelo(
    fotoCategoria: "assets/banner-salud.png",
    idCompraCategoria: 2,
    nombreCompraCategoria: "Salud",
    subcategorias: [
      SubCategoriaModelo(
        fotoCompraSubCategoria: "assets/decoracion.png",
        idCategoria: 2,
        idCompraSubCategoria: 3,
        nombreCompraSubCategoria: "Salud",
      ),
    ],
  ),
  //todo decoracion
  CategoriasModelo(
      fotoCategoria: "assets//decoracion.png",
      idCompraCategoria: 3,
      nombreCompraCategoria: "Decoración",
      subcategorias: [
        SubCategoriaModelo(
          fotoCompraSubCategoria: "assets/decoracion.png",
          idCategoria: 3,
          idCompraSubCategoria: 4,
          nombreCompraSubCategoria: "Decoración",
        ),
      ])
];
