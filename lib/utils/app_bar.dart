import 'package:app_socios/src/view/inside/Home/Notificaciones/Notificaciones.dart';
import 'package:app_socios/src/view/inside/Home/Publicar.dart';
import 'package:app_socios/utils/icons/abi_socios_icons.dart';
import 'package:flutter/material.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:path/path.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../src/view/inside/Home/crop_result_view.dart';

class MyAppBar extends Widget with InstaPickerInterface {
  GlobalKey<ScaffoldState> key;

  MyAppBar({required this.key});

  ThemeData themeData = ThemeData();

  AppBar myAppBar(
          {bool? back, BuildContext? context, required Container widgethide}) =>
      AppBar(
        leading: IconButton(
          onPressed: () => key.currentState!.openDrawer(),
          icon: Icon(
            Icons.menu_rounded, //icono de menú
            size: 30,
            color: Colors.grey[600],
          ),
        ),
        titleSpacing: 3,
        title: const Text(
          'CBEI',
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 29,
              color: Color.fromARGB(255, 14, 14, 14),
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.add, //Icono de subir post
                size: 30,
              ),
              onPressed: () {}),
          IconButton(
              icon: const Icon(
                Abi_socios.campanita, //icono de notificaciones
                size: 30,
              ),
              onPressed: () {}),
        ],
      );

  SliverAppBar mySliverAppBar(BuildContext context,
          {required Widget widgethide}) =>
      SliverAppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0,
          backgroundColor: const Color.fromARGB(
              255, 255, 255, 255), //themeData.scaffoldBackgroundColor,
          /*title: SizedBox(
        width: 130,
        child: Image.asset('assets/abi_praxis_logo.png'),
      ),*/
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Abi_socios.hamburguesa_icono,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () => key.currentState!.openDrawer(),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Abi_socios.agregar, //Icono de subir post
                  size: 20, color: Colors.black,
                ),
                onPressed: () => metodo(
                    context) /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => PickerDescription(context)))*/
                ),
            IconButton(
                icon: const Icon(Abi_socios.campanita, //icono de notificaciones
                    size: 22,
                    color: Colors.black),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => NotificacionesScreen(context))))
          ],
          floating: true,
          pinned: true,
          snap: false,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20), child: widgethide));

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
              icon: const Icon(Icons.camera_alt),
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
