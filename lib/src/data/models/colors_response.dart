class ColorsResponse {
  ColorsResponse({
    this.date,
    this.green,
    this.yellow,
    this.grey,
  });

  ColorsResponse.fromJson(dynamic json) {
    date = json['date'];
    green = json['green'] != null ? json['green'].cast<String>() : [];
    yellow = json['yellow'] != null ? json['yellow'].cast<String>() : [];
    grey = json['grey'] != null ? json['grey'].cast<String>() : [];
  }

  String? date;
  List<String>? green;
  List<String>? yellow;
  List<String>? grey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['green'] = green;
    map['yellow'] = yellow;
    map['grey'] = grey;
    return map;
  }
}
