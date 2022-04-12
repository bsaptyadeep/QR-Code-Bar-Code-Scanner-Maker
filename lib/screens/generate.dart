import 'dart:io';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:app/utils/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class Generate extends StatefulWidget {
  final String val;
  const Generate({Key? key, required this.val}) : super(key: key);

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  final controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/generatescreen.png'),
                fit: BoxFit.fill),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Screenshot(
                      controller: controller,
                      child: QrImage(
                        data: widget.val,
                        version: QrVersions.auto,
                        size: size.width - 200,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Successfully build your QR Code ',
                    style: TextStyle(
                      fontSize: 22,
                      color: violet3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      MaterialButton(
                        minWidth: size.width - 160,
                        height: 60,
                        onPressed: () async {
                          final image = await controller.capture();
                          if (image == null) return;
                          await saveImage(image);
                        },
                        child: const Text(
                          'Save to Device',
                          style: TextStyle(
                              color: violet3,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(120),
                          bottomLeft: Radius.circular(120),
                          bottomRight: Radius.circular(30),
                        )),
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        minWidth: size.width - 200,
                        height: 60,
                        onPressed: () async {
                          final image = await controller.capture();
                          if (image == null) return;
                          await saveAndShareImage(image);
                        },
                        child: const Text(
                          'Share with friends',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(150),
                        )),
                        color: violet3,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future saveAndShareImage(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    await Share.shareFiles([image.path]);
  }

  Future<String> saveImage(Uint8List bytes) async {
    //Request permissions if not already granted
    if (!(await Permission.storage.status.isGranted)) {
      await Permission.storage.request();
    }
    // await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }
}
