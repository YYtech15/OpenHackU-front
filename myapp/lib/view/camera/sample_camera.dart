import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  File? _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('勉強監視を始める'),
      ),
      body: Center(
        child: Column(
          children: [
            if (_file != null) Image.file(_file!),
            TextButton(
              onPressed: () async {
                final file =
                await ImagePicker().pickImage(source: ImageSource.camera);
                if (file == null) {
                  return;
                }
                setState(() {
                  _file = File(file.path);
                });
              },
              child: const Text('勉強監視カメラを起動する'),
            ),
            if (_file != null)
              TextButton(
                onPressed: () async {
                  var options = FaceDetectorOptions(
                    performanceMode: FaceDetectorMode.accurate,
                    enableLandmarks: true,
                    enableClassification: true,
                  );
                  final image = InputImage.fromFile(_file!);
                  final detector = GoogleMlKit.vision.faceDetector(options);
                  final faces = await detector.processImage(image);
                  print(faces);
                  for (final face in faces) {
                    print(face.boundingBox);
                  }
                },
                child: const Text('顔認識する'),
              ),
          ],
        ),
      ),
    );
  }
}