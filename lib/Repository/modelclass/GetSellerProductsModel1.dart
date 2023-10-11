class GetSellerProductsModel1 {
  GetSellerProductsModel1({
    this.data,
    this.meta,});

  GetSellerProductsModel1.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Data>? data;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

}

class Meta {
  Meta({
    this.limit,
    this.page,
    this.totalItems,});

  Meta.fromJson(dynamic json) {
    limit = json['limit'];
    page = json['page'];
    totalItems = json['totalItems'];
  }
  int? limit;
  int? page;
  int? totalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['limit'] = limit;
    map['page'] = page;
    map['totalItems'] = totalItems;
    return map;
  }

}

class Data {
  Data({
    this.id,
    this.brandId,
    this.cateId,
    this.createdAt,
    this.description,
    this.discount,
    this.image,
    this.isDeleted,
    this.isFeatured,
    this.isPublished,
    this.madeBy,
    this.name,
    this.price,
    this.rating,
    this.reviews,
    this.slug,
    this.stock,
    this.updatedAt,
    this.variations,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    brandId = json['brandId'];
    cateId = json['cateId'];
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    description = json['description'];
    discount = json['discount'];
    if (json['image'] != null) {
      image = [];
      json['image'].forEach((v) {
        image?.add(Image1.fromJson(v));
      });
    }
    isDeleted = json['isDeleted'];
    isFeatured = json['isFeatured'];
    isPublished = json['isPublished'];
    madeBy = json['madeBy'];
    name = json['name'];
    price = json['price'];
    rating = json['rating'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add((v));
      });
    }
    slug = json['slug'];
    stock = json['stock'];
    updatedAt = json['updatedAt'] != null ? UpdatedAt.fromJson(json['updatedAt']) : null;
    variations = json['variations'];
  }
  String? id;
  String? brandId;
  String? cateId;
  CreatedAt? createdAt;
  String? description;
  int? discount;
  List<Image1>? image;
  bool? isDeleted;
  bool? isFeatured;
  bool? isPublished;
  String? madeBy;
  String? name;
  int? price;
  int? rating;
  List<dynamic>? reviews;
  String? slug;
  int? stock;
  UpdatedAt? updatedAt;
  dynamic variations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['brandId'] = brandId;
    map['cateId'] = cateId;
    if (createdAt != null) {
      map['createdAt'] = createdAt?.toJson();
    }
    map['description'] = description;
    map['discount'] = discount;
    if (image != null) {
      map['image'] = image?.map((v) => v.toJson()).toList();
    }
    map['isDeleted'] = isDeleted;
    map['isFeatured'] = isFeatured;
    map['isPublished'] = isPublished;
    map['madeBy'] = madeBy;
    map['name'] = name;
    map['price'] = price;
    map['rating'] = rating;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['slug'] = slug;
    map['stock'] = stock;
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt?.toJson();
    }
    map['variations'] = variations;
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