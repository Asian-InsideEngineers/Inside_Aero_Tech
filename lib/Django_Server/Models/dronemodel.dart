class DroneModel {
  int? id;
  String? title;
  String? isSprayingOperation;
  String? isHomeSetpoint;
  String? isEmergencyDroneland;
  String? isDroneConnected;

  DroneModel(
      {this.id,
      this.title,
      this.isSprayingOperation,
      this.isHomeSetpoint,
      this.isEmergencyDroneland,
      this.isDroneConnected});

  DroneModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["is_spraying_operation"] is String) {
      isSprayingOperation = json["is_spraying_operation"];
    }
    if (json["is_home_setpoint"] is String) {
      isHomeSetpoint = json["is_home_setpoint"];
    }
    if (json["is_emergency_droneland"] is String) {
      isEmergencyDroneland = json["is_emergency_droneland"];
    }
    if (json["is_drone_connected"] is String) {
      isDroneConnected = json["is_drone_connected"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["is_spraying_operation"] = isSprayingOperation;
    _data["is_home_setpoint"] = isHomeSetpoint;
    _data["is_emergency_droneland"] = isEmergencyDroneland;
    _data["is_drone_connected"] = isDroneConnected;
    return _data;
  }
}
