class BannerModelclass {
  BannerModelclass({
      this.banners,});

  BannerModelclass.fromJson(dynamic json) {
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
  }
  List<Banners>? banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Banners {
  Banners({
      this.id, 
      this.createdAt, 
      this.image, 
      this.link, 
      this.productId, 
      this.title, 
      this.updatedAt, 
      this.userId,});

  Banners.fromJson(dynamic json) {
    id = json['_id'];
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    image = json['image'] != null ? Image1.fromJson(json['image']) : null;
    link = json['link'];
    productId = json['product_id'];
    title = json['title'];
    updatedAt = json['updatedAt'] != null ? UpdatedAt.fromJson(json['updatedAt']) : null;
    userId = json['user_id'];
  }
  String? id;
  CreatedAt? createdAt;
  Image1? image;
  String? link;
  String? productId;
  String? title;
  UpdatedAt? updatedAt;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (createdAt != null) {
      map['createdAt'] = createdAt?.toJson();
    }
    if (image != null) {
      map['image'] = image?.toJson();
    }
    map['link'] = link;
    map['product_id'] = productId;
    map['title'] = title;
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt?.toJson();
    }
    map['user_id'] = userId;
    return map;
  }

}

class UpdatedAt {
  UpdatedAt({
      this.t, 
      this.i,});

  UpdatedAt.fromJson(dynamic json) {
    t = json['T'];
    i = json['I'];
  }
  int? t;
  int? i;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['T'] = t;
    map['I'] = i;
    return map;
  }

}

class Image1 {
  Image1({
      this.name, 
      this.url,});

  Image1.fromJson(dynamic json) {
    name = json['name'];
    url = json['url'];
  }
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}

class CreatedAt {
  CreatedAt({
      this.t, 
      this.i,});

  CreatedAt.fromJson(dynamic json) {
    t = json['T'];
    i = json['I'];
  }
  int? t;
  int? i;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['T'] = t;
    map['I'] = i;
    return map;
  }

}