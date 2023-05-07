import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/good_job.svg',
              ),
            )
          ],
        ),
      ),
    );
  }
}
