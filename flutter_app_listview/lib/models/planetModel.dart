class Planet {
  List<String> residents;
  String sId;
  String created;
  String name;
  String url;
  String image;
  int iV;

  Planet(
      {this.residents,
        this.sId,
        this.created,
        this.name,
        this.url,
        this.image,
        this.iV});

  Planet.fromJson(Map<String, dynamic> json) {
    residents = json['residents'].cast<String>();
    sId = json['_id'];
    created = json['created'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['residents'] = this.residents;
    data['_id'] = this.sId;
    data['created'] = this.created;
    data['name'] = this.name;
    data['url'] = this.url;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}