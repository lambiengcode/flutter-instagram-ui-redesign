import 'package:camerawesome/camerapreview.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/models/orientations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CameraPreviewBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraPreviewBoxState();
}

class _CameraPreviewBoxState extends State<CameraPreviewBox> {
  ValueNotifier<CameraFlashes> _switchFlash = ValueNotifier(CameraFlashes.NONE);
  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
  ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.PHOTO);
  ValueNotifier<Size> _photoSize = ValueNotifier(null);
  ValueNotifier<double> _zoomSize = ValueNotifier(0.64);

  // Controllers
  // PictureController _pictureController = new PictureController();
  // VideoController _videoController = new VideoController();

  @override
  Widget build(BuildContext context) {
    return CameraAwesome(
      testMode: false,
      onPermissionsResult: (bool result) {},
      selectDefaultSize: (List<Size> availableSizes) => Size(1920, 1080),
      onCameraStarted: () {},
      onOrientationChanged: (CameraOrientations newOrientation) {},
      zoom: _zoomSize,
      sensor: _sensor,
      photoSize: _photoSize,
      switchFlashMode: _switchFlash,
      captureMode: _captureMode,
      orientation: DeviceOrientation.portraitUp,
      fitted: true,
    );
  }
}
