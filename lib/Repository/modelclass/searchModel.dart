class SearchModel {
  SearchModel({
    this.products,});

  SearchModel.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Products {
  Products({
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

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations?.add(Variations.fromJson(v));
      });
    }
    image = json['image'];
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
        reviews?.add(v);
      });
    }
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    updatedAt = json['UpdatedAt'] != null ? UpdatedAt.fromJson(json['UpdatedAt']) : null;
    madeBy = json['madeBy'];
  }
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic description;
  List<Variations>? variations;
  dynamic image;
  dynamic cateId;
  dynamic brandId;
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
  dynamic madeBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['description'] = description;
    if (variations != null) {
      map['variations'] = variations?.map((v) => v.toJson()).toList();
    }
    map['image'] = image;
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

class Variations {
  Variations({
    this.key,
    this.value,});

  Variations.fromJson(dynamic json) {
    key = json['Key'];
    value = json['Value'];
  }
  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Key'] = key;
    map['Value'] = value;
    return map;
  }

}