class Station2 {
  final double humi;
  final double soilmois;
  final double battery;

  Station2({this.humi, this.soilmois, this.battery});

  factory Station2.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Station2(
        humi: parser(json['Humidity']),
        soilmois: parser(json['SoilMoisture']),
        battery: parser(json['BatteryTwo']));
  }
}
