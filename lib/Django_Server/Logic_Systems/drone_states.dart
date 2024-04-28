import 'package:insideflyingconcept/Django_Server/Models/dronemodel.dart';

abstract class DroneState {
  final List<DroneModel> droneobjects;
  DroneState(this.droneobjects);
}

class DroneInitialState extends DroneState {
  DroneInitialState() : super([]);
}

class DroneConnectionLoadingState extends DroneState {
  DroneConnectionLoadingState(super.droneobjects);
}

class DroneConnntedState extends DroneState {
  DroneConnntedState(super.droneobjects);
}

class DroneConnectionLostState extends DroneState {
  final String message;
  DroneConnectionLostState(this.message, super.droneobjects);
}
