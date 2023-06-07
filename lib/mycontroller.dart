class modal {
  String? s0;
  String? s1;
  String? s2;
  String? s3;
  String? id;
  String? name;
  String? contact;
  String? images;

  modal(
      {this.s0,
        this.s1,
        this.s2,
        this.s3,
        this.id,
        this.name,
        this.contact,
        this.images});

  modal.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    id = json['id'];
    name = json['name'];
    contact = json['contact'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['id'] = this.id;
    data['name'] = this.name;
    data['contact'] = this.contact;
    data['images'] = this.images;
    return data;
  }
}