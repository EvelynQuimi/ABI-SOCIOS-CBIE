// ignore_for_file: use_build_context_synchronously

/*import 'dart:io';

import 'package:app_socios/utils/alerts/and_alert.dart';
import 'package:app_socios/utils/alerts/ios_alert.dart';
import 'package:app_socios/utils/flushBarGlobal.dart';
import 'package:app_socios/utils/selectFile/previsualizacion.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SeleccionArchivos {
  //todo IMÁGENES
  final iosAlert = IosAlert();
  final andAlert = AndroidAlert();
  ImagePicker imagePicker = ImagePicker();

  //todo DOCUMENTOS
  List<PlatformFile>? _paths;

  SeleccionArchivos(BuildContext context);

  Future<String?> selectOrCaptureImage(
      BuildContext context, ImageSource imageSource,
      {CropAspectRatio? radio}) async {
    String? pathImage;

    final status = await Permission.camera.status;

    if (status.isGranted) {
      final imageFile = await imagePicker.pickImage(source: imageSource);
      if (imageFile != null) {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => PreVisualizacion(
                      imageFile.path,
                      radio: radio,
                    ))).then((value) async {
          if (value != null) {
            pathImage = value;
          } else {
            scaffoldMessenger(
                context,
                "Acción cancelada.",
                const Icon(
                  Icons.clear,
                  color: Colors.red,
                ));
          }
        });
      } else {
        if (imageSource == ImageSource.camera) {
          scaffoldMessenger(
              context,
              "No se tomó la foto",
              const Icon(
                Icons.clear,
                color: Colors.red,
              ));
        } else {
          scaffoldMessenger(
              context,
              "No seleccionó ninguna imagen",
              const Icon(
                Icons.clear,
                color: Colors.red,
              ));
        }
      }
    } else {
      Platform.isAndroid
          ? andAlert.alertaPermisoCamaraManual(context)
          : iosAlert.alertaPermisoCamaraManual(context);
    }

    return pathImage;
  }

  Future<String?> openFileExplorer(
      FileType? _pickingType, BuildContext context) async {
    String? pathDoc;
    final status = await Permission.storage.status;
    if (status.isGranted) {
      _paths = (await FilePicker.platform.pickFiles(
              type: _pickingType!,
              allowedExtensions: ['pdf'],
              allowMultiple: false,
              dialogTitle: 'Esoja su archivo'))
          ?.files;

      if (_paths != null) {
        final bytes = _paths![0].size;
        final convert = bytes / (1024 * 1024);
        final size = convert.round();

        if (size < 3) {
          pathDoc = _paths![0].path!;
        } else {
          scaffoldMessenger(
              context,
              "El peso límite de un PDF es de 2 mb.",
              const Icon(
                Icons.error,
                color: Colors.red,
              ));
        }
      } else {
        scaffoldMessenger(
            context,
            "Acción cancelada.",
            const Icon(
              Icons.clear,
              color: Colors.red,
            ));
      }
    } else {
      Platform.isAndroid
          ? andAlert.alertaPermisoArchivosManual(context)
          : iosAlert.alertaPermisoArchivosManual(context);
    }
    return pathDoc!;
  }
}

class Permission {
  static var storage;

  static var camera;
}*/
