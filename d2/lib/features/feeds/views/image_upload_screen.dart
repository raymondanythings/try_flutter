import 'dart:io';
import 'package:camera/camera.dart';
import 'package:d2/constants/gaps.dart';
import 'package:d2/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen>
    with WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;
  bool _isFlashOn = false;
  late final bool _noCamera = kDebugMode && Platform.isIOS;
  // late CameraController _cameraController = CameraController();

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      return;
    }
    // _cameraController = CameraController(
    //   cameras[_isSelfieMode ? 1 : 0],
    //   ResolutionPreset.ultraHigh,
    // );

    // await _cameraController.initialize();

    // await _cameraController.prepareForVideoRecording();

    setState(() {});
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_noCamera) return;
    if (!_hasPermission) return;
    // if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      // _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera();
    }
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    initCamera();
  }

  Future<void> _toggleFlash() async {
    // await _cameraController
    //     .setFlashMode(_isFlashOn ? FlashMode.off : FlashMode.torch);
    setState(() {
      _isFlashOn = !_isFlashOn;
    });
  }

  Future<void> _captureImage() async {
    // final picture = await _cameraController.takePicture();
    // _onUploadImages([picture]);
  }

  Future<void> _onPickImagePress() async {
    final pictures = await ImagePicker().pickMultiImage(
      imageQuality: 40,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (pictures.isEmpty) return;
    if (!mounted) return;
    _onUploadImages(pictures);
  }

  void _onUploadImages(List<XFile> pictures) {
    Navigator.of(context).pop(pictures);
  }

  @override
  void initState() {
    super.initState();
    if (!_noCamera) {
      initPermissions();
    } else {
      setState(() {
        _hasPermission = true;
      });
    }
  }

  @override
  void dispose() {
    if (!_noCamera) {
      // _cameraController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // child: !_hasPermission || !_cameraController.value.isInitialized
          child: !_hasPermission
              ? const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Initializing...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size20,
                      ),
                    ),
                    Gaps.v20,
                    CircularProgressIndicator.adaptive(),
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              Sizes.size40,
                            ),
                            bottomRight: Radius.circular(
                              Sizes.size40,
                            ),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // if (!_noCamera &&
                            //     _cameraController.value.isInitialized)
                            //   CameraPreview(_cameraController),
                            Positioned(
                              top: MediaQuery.of(context).viewPadding.top +
                                  Sizes.size8,
                              left: Sizes.size32,
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: const FaIcon(
                                  FontAwesomeIcons.chevronLeft,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: Sizes.size28,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    // onTap: _toggleFlash,
                                    child: FaIcon(
                                      _isFlashOn
                                          ? Icons.flash_on
                                          : Icons.flash_off,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      const SizedBox(
                                        width: Sizes.size60 + Sizes.size14,
                                        height: Sizes.size60 + Sizes.size14,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: Sizes.size4,
                                          value: 1,
                                        ),
                                      ),
                                      GestureDetector(
                                        // onTap: _captureImage,
                                        child: Container(
                                          width: Sizes.size60,
                                          height: Sizes.size60,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    // onPressed: _toggleSelfieMode,
                                    icon: const FaIcon(
                                      FontAwesomeIcons.rotate,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Sizes.size96 + Sizes.size20,
                      child: Row(
                        children: [
                          const Spacer(),
                          const Text(
                            "Camera",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: GestureDetector(
                                onTap: _onPickImagePress,
                                child: Text(
                                  "Library",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
