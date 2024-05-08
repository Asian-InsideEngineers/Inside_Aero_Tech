import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:fancy_drawer/fancy_drawer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:insideflyingconcept/Bloc%20Providers/Connectivity_Plus/connectivity_bloc.dart';

import 'package:insideflyingconcept/Bloc%20Providers/Connectivity_Plus/connectivity_state.dart';
import 'package:insideflyingconcept/Dashboard/Server_Features/flight_modes.dart';
import 'package:insideflyingconcept/Django_Server/Logic_Systems/drone_cubit.dart';
import 'package:insideflyingconcept/Django_Server/Logic_Systems/drone_states.dart';

import 'package:insideflyingconcept/Soil%20Info/soilinfo.dart';
import 'package:insideflyingconcept/Surveying/survey.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Lottie.asset("assets/lottie/drone.json"),
        );
      },
    );
  }

  late FancyDrawerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return FancyDrawerWrapper(
      drawerPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      controller: _controller,
      drawerItems: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Colors.deepPurple, Colors.deepPurpleAccent]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AEROTECH \nSmartAgri Services",
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30)),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.solidClipboard,
                          color: Colors.white,
                        )),
                    const Text(
                      "Training",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.adn,
                          color: Colors.white,
                        )),
                    const Text(
                      "About us",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.solidEnvelopeOpen,
                          color: Colors.white,
                        )),
                    const Text(
                      "Feedback",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     IconButton(
              //         onPressed: () {},
              //         icon: const FaIcon(
              //           FontAwesomeIcons.userShield,
              //           color: Colors.white,
              //         )),
              //     const Text(
              //       "Help & Support",
              //       style: TextStyle(
              //         fontSize: 24,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ],
              // ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, Settings().routeName);
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.gear,
                          color: Colors.white,
                        )),
                    const Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width * 0.4,
                height: 100,
                alignment: Alignment.center,
                child: const Text(
                  "Machine Version 0.1.1",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: const EdgeInsets.all(5),
                onPressed: () {
                  _controller.toggle();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.bars,
                  color: Colors.white,
                ),
              ),
              Text(
                "RIFM",
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    BlocBuilder<InternetConnectivityBloc, InternetStates>(
                      builder: (context, state) {
                        if (state is InternetConnectedviamobile ||
                            state is InternetConnectedviawifi) {
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.green, Colors.lightGreen],
                                      begin: Alignment.topCenter,
                                      end: Alignment.topLeft),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    BlocBuilder<InternetConnectivityBloc,
                                        InternetStates>(
                                      builder: (context, state) {
                                        if (state
                                            is InternetConnectedviamobile) {
                                          return const Icon(
                                            Icons.mobile_friendly,
                                            color: Colors.white,
                                          );
                                        } else if (state
                                            is InternetConnectedviawifi) {
                                          return const Icon(
                                            Icons.wifi,
                                            color: Colors.white,
                                          );
                                        } else {
                                          return const Icon(
                                            Icons.wifi_off,
                                            color: Colors.white,
                                          );
                                        }
                                      },
                                    ),
                                    BlocBuilder<InternetConnectivityBloc,
                                        InternetStates>(
                                      builder: (context, state) {
                                        if (state
                                            is InternetConnectedviamobile) {
                                          return Text(
                                            "Mobile Network Connected",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        } else if (state
                                            is InternetConnectedviawifi) {
                                          return Text(
                                            "Wifi Network Connected",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            "Internet Lost",
                                            style: GoogleFonts.montserrat(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Colors.white,
                                  Colors.white54
                                ])),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    BlocBuilder<DroneCubit, DroneState>(
                                      builder: (context, state) {
                                        if (state
                                                is DroneConnectionLoadingState ||
                                            state.droneobjects.isEmpty) {
                                          return const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  CircularProgressIndicator(
                                                    color: Colors.blue,
                                                  ),
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Text(
                                                    "Verifying Flight Modes",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        } else if (state
                                            is DroneConnntedState) {
                                          return FlightModes(
                                            dronemodel: state.droneobjects,
                                            shrinkwrap: true,
                                            noscroll: true,
                                          );
                                        } else if (state
                                                is DroneConnntedState ||
                                            state.droneobjects.isEmpty) {
                                          return const Text(
                                            "No Flight Modes Available",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          );
                                        }
                                        return const SizedBox();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }
                        if (state is InternetDisconnectedState) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.red, Colors.redAccent])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                BlocBuilder<InternetConnectivityBloc,
                                    InternetStates>(
                                  builder: (context, state) {
                                    if (state is InternetDisconnectedState) {
                                      return const Icon(
                                        Icons.wifi_off,
                                        color: Colors.white,
                                      );
                                    } else {
                                      return const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      );
                                    }
                                  },
                                ),
                                BlocBuilder<InternetConnectivityBloc,
                                    InternetStates>(
                                  builder: (context, state) {
                                    if (state is InternetDisconnectedState) {
                                      return Text(
                                        "Internet Lost",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        "Internet Searching",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.white70),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [Colors.deepPurple, Colors.blueAccent],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              DashedCircularProgressBar.aspectRatio(
                                aspectRatio: 2.5, // width ÷ height
                                valueNotifier: _valueNotifier,
                                progress: 37,
                                startAngle: 225,
                                sweepAngle: 270,
                                foregroundColor: Colors.green,
                                backgroundColor: const Color(0xffeeeeee),
                                foregroundStrokeWidth: 15,
                                backgroundStrokeWidth: 15,
                                animation: true,
                                seekSize: 1,
                                seekColor: const Color(0xffeeeeee),
                                child: Center(
                                  child: ValueListenableBuilder(
                                    valueListenable: _valueNotifier,
                                    builder: (_, double value, __) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '${value.toInt()}%',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40),
                                        ),
                                        const Text(
                                          'Cycle Progress',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Text(
                                        "Fertilizer",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        "UREA",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Area",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        "10-ACRES",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Crop Health",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        "GOOD",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.white, Colors.white54],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            scale: 8,
                                            "assets/icons/fertilizer.png"),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: CupertinoButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, SoilInfo.routeName);
                                          },
                                          child: Text(
                                            "Soil Info",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            scale: 8,
                                            "assets/icons/spraying.png"),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: CupertinoButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, Survey.routeName);
                                          },
                                          child: Text(
                                            "Surveying",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            scale: 8,
                                            "assets/icons/analysis.png"),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: CupertinoButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Analyis",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                            scale: 8,
                                            "assets/icons/payment.png"),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: CupertinoButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Subscription",
                                            style: GoogleFonts.montserrat(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 15),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.deepPurple,
                                                Colors.blueAccent
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              IconButton(
                                                onPressed: () {},
                                                icon: Image.asset(
                                                    scale: 5,
                                                    "assets/icons/drone.png"),
                                              ),
                                              Text(
                                                "Start Spraying Operation",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 15),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.deepPurple,
                                                Colors.blueAccent
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              IconButton(
                                                onPressed: () {},
                                                icon: Image.asset(
                                                    scale: 5,
                                                    "assets/icons/drone.png"),
                                              ),
                                              Text(
                                                "Previous Drone Spraying Record",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 15),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.deepPurple,
                                                Colors.blueAccent
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              IconButton(
                                                onPressed: () {},
                                                icon: Image.asset(
                                                    scale: 5,
                                                    "assets/icons/drone.png"),
                                              ),
                                              Text(
                                                "Drone Return to Home Setpoint",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 15),
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.deepPurple,
                                                Colors.blueAccent
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              IconButton(
                                                onPressed: () {},
                                                icon: Image.asset(
                                                    scale: 5,
                                                    "assets/icons/drone.png"),
                                              ),
                                              Text(
                                                "Emergency Drone Land",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: Colors.white,
            elevation: 6.0,
            child: const FaIcon(
              FontAwesomeIcons.planeCircleCheck,
              color: Colors.blueAccent,
              size: 20,
            ),
            onPressed: () {
              _showBottomSheet(context);
            }),
      ),
    );
  }
}
