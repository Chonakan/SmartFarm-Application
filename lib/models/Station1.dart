class Station1 {
  final double tempC;
  final double tempD;
  final double battery;

  Station1({this.tempC, this.tempD, this.battery});

  factory Station1.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Station1(
        tempC: parser(json['Celcius']),
        tempD: parser(json['DirtTemp']),
        battery: parser(json['BatteryOne']));
  }
}
