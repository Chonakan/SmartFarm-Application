class Station3 {
  final double ldr;
  final double light;
  final double battery;

  Station3({this.ldr, this.light, this.battery});

  factory Station3.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Station3(
        ldr: parser(json['LDR']),
        light: parser(json['Light']),
        battery: parser(json['BatteryThree']));
  }
}
