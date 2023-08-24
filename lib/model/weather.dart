class Weather {
  final int? id;
  final String? main, des, icon;

  Weather({this.id, this.main, this.des, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: int.parse(json["id"].toString()),
      main: json["main"],
      des: json["description"],
      icon: json["icon"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "main": main,
      "description": des,
      "icon": icon,
    };
  }
}
