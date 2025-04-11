import 'source.dart';

class SourcesResponse {
  String? status;
  List<Source>? sources;
  String? message;

  SourcesResponse({
    this.status,
    this.sources,
    this.message,
  });

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    } else {
      message = json['message'];
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
