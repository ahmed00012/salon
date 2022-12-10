

class OnBoardingContent {
  List<Intro>? intro;
  String? slogan;
  String? image;

  OnBoardingContent({this.intro, this.slogan, this.image});

  OnBoardingContent.fromJson(Map<String, dynamic> json) {
    if (json['intro'] != null) {
      intro = <Intro>[];
      json['intro'].forEach((v) {
        intro!.add(new Intro.fromJson(v));
      });
    }
    slogan = json['slogan'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.intro != null) {
      data['intro'] = this.intro!.map((v) => v.toJson()).toList();
    }
    data['slogan'] = this.slogan;
    data['image'] = this.image;
    return data;
  }
}

class Intro {
  String? id;
  Title? title;
  Title? description;
  String? image;
  int? type;
  String? createdAt;
  String? updatedAt;

  Intro(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.type,
        this.createdAt,
        this.updatedAt});

  Intro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? new Title.fromJson(json['description'])
        : null;
    image = json['image'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['image'] = this.image;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Title {
  String? en;
  String? ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}
