import 'package:atlas_coins/src/components/base_structure.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:atlas_coins/main.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.authController,
    this.marginBottom = 0.0,
  }) : super(key: key);

  final double marginBottom;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: size10, bottom: marginBottom),
        height: size80,
        width: size80,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: labelColor,
        ),
        child: authController.authModel.imageUrl == ""
            ? Padding(
                padding: const EdgeInsets.all(size10),
                child: SvgPicture.asset(
                  "assets/icons/person.svg",
                  color: whiteColor,
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(size100),
                child: Image.network(
                  authController.authModel.imageUrl!,
                  height: size45,
                  width: size45,
                ),
              ),
      ),
      onTap: () {
        Get.to(
          () => PictureUserProfile(
            authController: authController,
          ),
        );
      },
    );
  }
}

class PictureUserProfile extends StatefulWidget {
  const PictureUserProfile({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  State<PictureUserProfile> createState() => _PictureUserProfileState();
}

class _PictureUserProfileState extends State<PictureUserProfile> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.veryHigh,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SizedBox(
              height: double.infinity,
              child: Stack(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        child: CameraPreview(_controller),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 00,
                    child: Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () async {
                          try {
                            final image = await _controller.takePicture();
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DisplayPictureScreen(
                                  imagePath: image.path,
                                  authController: widget.authController,
                                ),
                              ),
                            );
                          } catch (e) {}
                        },
                        child: Container(
                          height: size70,
                          width: size70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size35),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: lighterColor,
                              width: 5,
                            ),
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    right: 10,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 190,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size05),
                          color: backgroundColor.withOpacity(0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.flash_off,
                                size: 30,
                                color: whiteColor,
                              ),
                            ),
                            const SizedBox(height: size20),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.flip_camera_ios,
                                size: 30,
                                color: whiteColor,
                              ),
                            ),
                            const SizedBox(height: size20),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.photo,
                                size: 30,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                "Iniciando a câmera...",
                style: AppTheme.lightText.displayMedium!.apply(
                  color: whiteColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final AuthController authController;

  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
    required this.authController,
  }) : super(key: key);

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    return BaseStructure(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarApp(
            onPressed: () => Get.back(),
            title: "Foto do perfil",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: size100, bottom: size20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size100),
                      color: cardBackgroundColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size100),
                      child: Image.file(
                        File(widget.imagePath),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  Text(
                    widget.authController.authModel.name!,
                    style: AppTheme.lightText.titleLarge!.apply(
                      color: whiteColor,
                    ),
                  ),
                  Text(
                    widget.authController.authModel.email!,
                    style: AppTheme.lightText.labelSmall!.apply(
                      color: labelColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonWidget(
            label: "Salvar",
            margin: const EdgeInsets.fromLTRB(size15, size20, size15, size20),
            onPressed: () async {},
          ),
        ],
      ),
    );
  }
}
