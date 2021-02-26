class St {
  final int status;

  St({this.status});

  factory St.fromJson(Map<dynamic, dynamic> json) {
    int parser(dynamic source) {
      try {
        return int.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return St(status: parser(json['State']));
  }
}
