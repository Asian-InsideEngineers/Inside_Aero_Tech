import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insideflyingconcept/Django_Server/Drone%20Repository/dronerepository.dart';
import 'package:insideflyingconcept/Django_Server/Logic_Systems/drone_states.dart';
import 'package:insideflyingconcept/Django_Server/Models/dronemodel.dart';

class DroneCubit extends Cubit<DroneState> {
  DroneCubit() : super(DroneInitialState()) {
    productinitialization();
  }
  final _dronerepository = DroneRepository();

  void productinitialization() async {
    emit(DroneConnectionLoadingState(state.droneobjects));
    try {
      List<DroneModel> newproducts = await _dronerepository.getallflightmodes();
      emit(DroneConnntedState(
        newproducts,
      ));
    } catch (error) {
      emit(DroneConnectionLostState(error.toString(), state.droneobjects));
    }
  }
}
