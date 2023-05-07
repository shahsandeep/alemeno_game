import 'package:alemeno_game_internship/constants/route.dart';
import 'package:alemeno_game_internship/screens/land_clicked_picutre.dart';
import 'package:alemeno_game_internship/screens/land_home.dart';
import 'package:alemeno_game_internship/screens/land_share_picture.dart';
import 'package:alemeno_game_internship/screens/message.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGeneratreRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => const LandHomeScreen(),
        );

      case landPictureRoute:
        return MaterialPageRoute(
          builder: (context) => const LandClickPictureScreen(),
        );
      case landSharePictureRoute:
        return MaterialPageRoute(
          builder: (context) => const LandSharePictureScreen(),
        );
      case message:
        return MaterialPageRoute(
          builder: (context) => const MessageScreen(),
        );

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      body: Column(
        children: const [
          Center(
            child: Text('Sorry not Found!'),
          )
        ],
      ),
    );
  });
}
