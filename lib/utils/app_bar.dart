import 'package:app_socios/src/view/inside/Home/Notificaciones/Notificaciones.dart';
import 'package:app_socios/src/view/inside/Home/Publicar.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:app_socios/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:path/path.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import '../src/view/inside/Home/crop_result_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends Widget with InstaPickerInterface {
  GlobalKey<ScaffoldState> key;

  MyAppBar({required this.key});

  ThemeData themeData = ThemeData();

  SliverAppBar mySliverAppBar(BuildContext context,
          {required Widget widgethide,
          bool? action,
          bool? hide,
          bool? mostrar}) =>
      SliverAppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 85,
          leadingWidth: 0.0,
          titleSpacing: 0.0,
          scrolledUnderElevation: 0.0,
          elevation: 110,
          backgroundColor: const Color.fromARGB(
              255, 255, 255, 255), //themeData.scaffoldBackgroundColor,
          flexibleSpace: FlexibleSpaceBar(
            title: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: Responsive.of(context).hp(12.5),
                    width: double.infinity,
                    child: Image.asset(
                      "assets/banner-top.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/logo-cbei.png",
                    width: 55,
                    height: 55,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: -10,
                  child: IconButton(
                    icon: const Icon(
                      Abi_socios.hamburguesa_icono,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () => key.currentState!.openDrawer(),
                  ),
                ),
                if (action != null && action)
                  Positioned(
                    bottom: 10,
                    right: 25,
                    child: IconButton(
                        icon: const Icon(
                          Abi_socios.agregar, //Icono de subir post
                          size: 13, color: Colors.black,
                        ),
                        onPressed: () => metodo(context)),
                  ),
                if (action != null && action)
                  Positioned(
                      bottom: 10,
                      right: -5,
                      child: IconButton(
                          icon: const Icon(
                              Abi_socios.campanita, //icono de notificaciones
                              size: 15,
                              color: Colors.black),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      NotificacionesScreen(context))))),
                if (mostrar != null && mostrar)
                  Positioned(
                      bottom: 10,
                      right: 25,
                      child: IconButton(
                          tooltip: "Galeria",
                          icon: const Icon(
                              Abi_socios
                                  .galeria_icono, //icono de notificaciones
                              size: 15,
                              color: Colors.black),
                          onPressed: () async {
                            const url =
                                'https://www.ecuadoritalia.com/galerria';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'No se pudo abrir $url';
                            }
                          })),
                if (mostrar != null && mostrar)
                  Positioned(
                      bottom: 10,
                      right: -5,
                      child: IconButton(
                          icon: const Icon(
                              Abi_socios.agenda_icono, //icono de notificaciones
                              size: 15,
                              color: Colors.black),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      NotificacionesScreen(context))))),
              ],
            ),
          ),
          centerTitle: true,
          expandedHeight: hide != null && !hide ? 0 : 155,
          floating: true,
          pinned: true,
          snap: false,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50), child: widgethide));

  Future<void> _pickFromWeChatCamera(BuildContext context) async {
    Feedback.forTap(context);
    final AssetEntity? entity = await CameraPicker.pickFromCamera(
      context,
      locale: Localizations.maybeLocaleOf(context),
      pickerConfig: CameraPickerConfig(
        theme: Theme.of(context),
        resolutionPreset: cameraResolutionPreset,
        // to allow video recording
        enableRecording: true,
      ),
    );
    if (entity == null) return;

    if (context.mounted) {
      await InstaAssetPicker.refreshAndSelectEntity(context, entity);
    }
  }

  void metodo(context) => InstaAssetPicker.pickAssets(
        context,
        pickerConfig: InstaAssetPickerConfig(
          title: "Nueva Publicación",
          pickerTheme: getPickerTheme(context),
          actionsBuilder: (
            BuildContext context,
            ThemeData? pickerTheme,
            double height,
            VoidCallback unselectAll,
          ) =>
              [
            InstaPickerCircleIconButton.unselectAll(
              onTap: unselectAll,
              theme: pickerTheme,
              size: height,
            ),
            const SizedBox(width: 8),
            InstaPickerCircleIconButton(
              onTap: () => _pickFromWeChatCamera(context),
              theme: pickerTheme,
              icon: const Icon(Abi_socios.camera),
              size: height,
            ),
          ],
          specialItemBuilder: (context, _, __) {
            // return a button that open the camera
            return ElevatedButton(
              onPressed: () => _pickFromWeChatCamera(context),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  InstaAssetPicker.defaultTextDelegate(context)
                      .sActionUseCameraHint,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          // since the list is revert, use prepend to be at the top
          specialItemPosition: SpecialItemPosition.prepend,
        ), //Numero permitido de fotos a publicar
        maxAssets: 10,

        onCompleted: (cropStream) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PickerCropResultScreen(cropStream: cropStream),
            ),
          );
        },
      );

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

  @override
  // TODO: implement description
  PickerDescription get description => throw UnimplementedError();
}
