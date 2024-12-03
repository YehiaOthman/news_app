class SourceAr {
  String? id;
  String? name;

  SourceAr({
    this.id,
    this.name,
  });

  SourceAr.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
