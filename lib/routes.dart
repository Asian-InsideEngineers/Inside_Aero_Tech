import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insideflyingconcept/Authentication/googlelogin.dart';
import 'package:insideflyingconcept/Settings/setting.dart';
import 'package:insideflyingconcept/Soil%20Info/soilinfo.dart';
import 'package:insideflyingconcept/Surveying/survey.dart';
import 'splashscreen.dart';

class Routes {
  static Route? systemRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());

      case Settings.routeName:
        return CupertinoPageRoute(
          builder: (context) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                'Settings',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              backgroundColor: CupertinoColors.white,
              leading: CupertinoNavigationBarBackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              padding: const EdgeInsetsDirectional.only(start: 10),
            ),
            child: const Center(
              child: Settings(),
            ),
          ),
          settings: settings,
        );

      case Survey.routeName:
        return CupertinoPageRoute(
          builder: (context) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                'Surveying Records',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              backgroundColor: CupertinoColors.white,
              leading: CupertinoNavigationBarBackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              padding: const EdgeInsetsDirectional.only(start: 10),
            ),
            child: const Center(
              child: Survey(),
            ),
          ),
          settings: settings,
        );
      case SoilInfo.routeName:
        return CupertinoPageRoute(
          builder: (context) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                'Soil Info',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              backgroundColor: CupertinoColors.white,
              leading: CupertinoNavigationBarBackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              padding: const EdgeInsetsDirectional.only(start: 10),
            ),
            child: const Center(
              child: SoilInfo(),
            ),
          ),
          settings: settings,
        );

      case GoogleLogin.routeName:
        return CupertinoPageRoute(builder: (context) => const GoogleLogin());

      default:
        return null;
    }
  }
}
