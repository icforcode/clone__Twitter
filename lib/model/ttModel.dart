// ignore_for_file: camel_case_types, file_names

class ttModel {
  String? location;
  String? hastag;
  String? tweets;

  ttModel({this.location, this.hastag, this.tweets});

  ttModel.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    hastag = json['hastag'];
    tweets = json['tweets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['hastag'] = hastag;
    data['tweets'] = tweets;
    return data;
  }
}
