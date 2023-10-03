class GetAproductModelclass {
  GetAproductModelclass({
      this.data,});

  GetAproductModelclass.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.name, 
      this.slug, 
      this.description, 
      this.variations, 
      this.image, 
      this.cateId, 
      this.brandId, 
      this.rating, 
      this.price, 
      this.stock, 
      this.discount, 
      this.isFeatured, 
      this.isDeleted, 
      this.isPublished, 
      this.reviews, 
      this.createdAt, 
      this.updatedAt, 
      this.madeBy,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    variations = json['variations'];
    if (json['image'] != null) {
      image = [];
      json['image'].forEach((v) {
        image?.add(Image1.fromJson(v));
      });
    }
    cateId = json['cateId'];
    brandId = json['brandId'];
    rating = json['rating'];
    price = json['price'];
    stock = json['stock'];
    discount = json['discount'];
    isFeatured = json['isFeatured'];
    isDeleted = json['isDeleted'];
    isPublished = json['isPublished'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add((v));
      });
    }
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    updatedAt = json['UpdatedAt'] != null ? UpdatedAt.fromJson(json['UpdatedAt']) : null;
    madeBy = json['madeBy'];
  }
  String? id;
  String? name;
  String? slug;
  String? description;
  dynamic variations;
  List<Image1>? image;
  String? cateId;
  String? brandId;
  int? rating;
  int? price;
  int? stock;
  int? discount;
  bool? isFeatured;
  bool? isDeleted;
  bool? isPublished;
  List<dynamic>? reviews;
  CreatedAt? createdAt;
  UpdatedAt? updatedAt;
  String? madeBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    map['variations'] = variations;
    if (image != null) {
      map['image'] = image?.map((v) => v.toJson()).toList();
    }
    map['cateId'] = cateId;
    map['brandId'] = brandId;
    map['rating'] = rating;
    map['price'] = price;
    map['stock'] = stock;
    map['discount'] = discount;
    map['isFeatured'] = isFeatured;
    map['isDeleted'] = isDeleted;
    map['isPublished'] = isPublished;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    if (createdAt != null) {
      map['createdAt'] = createdAt?.toJson();
    }
    if (updatedAt != null) {
      map['UpdatedAt'] = updatedAt?.toJson();
    }
    map['madeBy'] = madeBy;
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