import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insideflyingconcept/Authentication/authservices.dart';
import 'package:provider/provider.dart';

import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  static const String routeName = "Setting";

  final String number = "9623038597";

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.transparent,
              elevation: 10,
              child: FittedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.deepPurple, Colors.deepPurpleAccent]),
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            FittedBox(
                              child: AutoSizeText(
                                "Premium Member",
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                maxFontSize: 30,
                                maxLines: 1,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'Are you sure!',
                                  desc: 'Press on OK button to logout from App',
                                  btnOkOnPress: () {
                                    final provider =
                                        Provider.of<GoogleSignInProvider>(
                                            context,
                                            listen: false);
                                    provider.logout();
                                  },
                                  btnCancelOnPress: () {},
                                ).show();
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.rightFromBracket,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 50,
                                backgroundImage: NetworkImage(user.photoURL!),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 0, right: 0, left: 15),
                                child: FittedBox(
                                  clipBehavior: Clip.none,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      FittedBox(
                                        clipBehavior: Clip.none,
                                        child: AutoSizeText(
                                          user.displayName!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 35,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          minFontSize: 25,
                                          maxLines: 1,
                                        ),
                                      ),
                                      FittedBox(
                                        child: AutoSizeText(
                                          user.email!,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                          minFontSize: 12,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25, right: 5, left: 5, bottom: 0),
                      child: SettingsList(
                        sections: [
                          SettingsSection(
                            title: const Text('Common'),
                            tiles: [
                              SettingsTile(
                                title: const Text('Language'),
                                // titleTextStyle:
                                //     GoogleFonts.montserrat(fontSize: 16),

                                leading: const FaIcon(
                                  FontAwesomeIcons.language,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onPressed: (BuildContext context) {},
                              ),
                              SettingsTile(
                                title: const Text('Rate us'),
                                leading: const FaIcon(
                                  FontAwesomeIcons.star,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onPressed: (BuildContext context) async {
                                  // await LaunchApp.openApp(
                                  //   androidPackageName:
                                  //       "com.mdksdcollege.mdksdcollege",
                                  //   openStore: true,
                                  // );
                                },
                              ),
                            ],
                          ),
                          SettingsSection(
                            title: const Text('Services'),
                            tiles: [
                              SettingsTile(
                                title: const Text('Share us'),
                                leading: const FaIcon(
                                  FontAwesomeIcons.share,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onPressed: (BuildContext context) {
                                  _sharefeatures(context);
                                },
                              ),
                              SettingsTile(
                                title: const Text('Contact us'),
                                leading: const FaIcon(
                                  FontAwesomeIcons.phone,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onPressed: (BuildContext context) async {
                                  FlutterPhoneDirectCaller.callNumber(
                                      "9405109103");
                                  launchUrlString("tel://$number");
                                },
                              ),
                            ],
                          ),
                          SettingsSection(
                            title: const Text('About us'),
                            tiles: [
                              SettingsTile(
                                title: const Text('Research In Flying Motion'),
                                leading: const FaIcon(
                                  FontAwesomeIcons.android,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onPressed: (BuildContext context) {},
                              ),
                              SettingsTile(
                                title: const Text('Privacy & Policies'),
                                leading: const FaIcon(
                                  FontAwesomeIcons.book,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onPressed: (BuildContext context) {},
                              ),
                              SettingsTile(
                                title: const Text('Terms & Conditions'),
                                leading: const FaIcon(
                                  FontAwesomeIcons.book,
                                  color: Colors.deepPurpleAccent,
                                ),
                                onPressed: (BuildContext context) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _sharefeatures(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox?;

  await Share.share("Thanks for Supporting us",
      subject: "Team Inside Engineers",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
}
