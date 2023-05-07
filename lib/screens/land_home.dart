import 'package:alemeno_game_internship/constants/colors.dart';
import 'package:alemeno_game_internship/constants/route.dart';
import 'package:flutter/material.dart';

class LandHomeScreen extends StatelessWidget {
  const LandHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(landPictureRoute);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 40,
                  ),
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Share your meal',
                    style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
