import 'package:alemeno_game_internship/viewModels/picture_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';

class LandSharePictureScreen extends StatelessWidget {
  const LandSharePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.watch<PictureViewModel>();
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset(
                  'assets/icons/back_button_icon.svg',
                ),
              ),
            ),
            Image.asset(
              'assets/images/animal.png',
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: containerBgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        const Text(
                          'Will you eat this?',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            data.uploadPicture(context);
                          },
                          child: data.isLoading
                              ? const CircularProgressIndicator(
                                  color: greenColor,
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    color: greenColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/select_icon.svg',
                                  ),
                                ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 100,
                    left: 60,
                    right: 60,
                    child: SvgPicture.asset(
                      'assets/images/picture_frame.svg',
                    ),
                  ),
                  Positioned(
                    top: 110,
                    bottom: 220,
                    left: 0,
                    right: 320,
                    child: SvgPicture.asset(
                      'assets/images/utensil_fork.svg',
                    ),
                  ),
                  Positioned(
                    top: 110,
                    bottom: 220,
                    left: 320,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/images/utensil.svg',
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 100,
                    left: 90,
                    right: 90,
                    child: CircleAvatar(
                      maxRadius: 40,
                      backgroundImage: FileImage(data.image!),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
