import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Django_Server/Models/dronemodel.dart';

class FlightModes extends StatelessWidget {
  final List<DroneModel> dronemodel;
  final bool shrinkwrap;
  final bool noscroll;

  const FlightModes({
    super.key,
    required this.dronemodel,
    this.shrinkwrap = false,
    this.noscroll = false,
  });

  @override
  Widget build(BuildContext context) {
    if (dronemodel.isEmpty) {
      return Center(
        child: Text(
          "No Flight Modes Available",
          style: GoogleFonts.montserrat(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: shrinkwrap,
      physics: (noscroll) ? const NeverScrollableScrollPhysics() : null,
      itemCount: dronemodel.length,
      itemBuilder: (context, index) {
        final droneData = dronemodel[index];

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Sprying Operation",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                FittedBox(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width / 3,
                    alignment: Alignment.center,
                    child: Text(
                      ("${droneData.isSprayingOperation}"),
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Emergency Drone Land",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width / 3,
                        alignment: Alignment.center,
                        child: Text(
                          ("${droneData.isEmergencyDroneland}"),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Home Setpoint",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width / 3,
                        alignment: Alignment.center,
                        child: Text(
                          ("${droneData.isHomeSetpoint}"),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Drone Connection",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                FittedBox(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width / 3,
                        alignment: Alignment.center,
                        child: Text(
                          ("${droneData.isDroneConnected}"),
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
