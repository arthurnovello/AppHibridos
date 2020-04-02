class Character {
  String species;
  String status;
  String originPlanet;
  String gender;
  String sId;
  String name;
  String series;
  String created;
  String url;
  String image;
  int iV;

  Character(
      {this.species,
        this.status,
        this.originPlanet,
        this.gender,
        this.sId,
        this.name,
        this.series,
        this.created,
        this.url,
        this.image,
        this.iV});

  Character.fromJson(Map<String, dynamic> json) {
    species = json['species'];
    status = json['status'];
    originPlanet = json['originPlanet'];
    gender = json['gender'];
    sId = json['_id'];
    name = json['name'];
    series = json['series'];
    created = json['created'];
    url = json['url'];
    image = json['image'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['species'] = this.species;
    data['status'] = this.status;
    data['originPlanet'] = this.originPlanet;
    data['gender'] = this.gender;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['series'] = this.series;
    data['created'] = this.created;
    data['url'] = this.url;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}