import 'package:alemeno_game_internship/screens/land_clicked_picutre.dart';
import 'package:alemeno_game_internship/screens/land_home.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGeneratreRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LandHomeScreen(),
        );

      case '/landClickPicture':
        return MaterialPageRoute(
          builder: (context) => const LandClickPictureScreen(),
        );
      case '/landSharePicture':
        return MaterialPageRoute(
          builder: (context) => const LandClickPictureScreen(),
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
