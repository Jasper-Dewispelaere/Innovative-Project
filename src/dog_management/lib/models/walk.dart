class Walk {
  final String id;
  final String name;
  final String distance;
  final String time;
  final String date;

  Walk({ required this.id, required this.name, required this.distance, required this.time, required this.date});

  factory Walk.fromJson(Map<String, dynamic> json) {
  return Walk(
    id: json['id'],
    name: json['name'],
    distance: json['distance'],
    time: json['time'],
    date: json['date']
  );
}


  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'distance': distance,
        'time': time,
        'date': date
      };
}
