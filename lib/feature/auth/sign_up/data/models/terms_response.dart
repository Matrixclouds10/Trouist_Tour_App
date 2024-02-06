

class TermsResponse {
  int? id;
  String? name;
  String? description;
  String? image;

  TermsResponse({this.id, this.name, this.description, this.image});

  TermsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
