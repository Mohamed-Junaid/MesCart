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
        reviews?.add(Reviews.fromJson(v));
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
  List<Reviews>? reviews;
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

class Reviews {
  Reviews({
      this.id, 
      this.userId, 
      this.user, 
      this.rating, 
      this.comment, 
      this.createdAt, 
      this.updatedAt,});

  Reviews.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    updatedAt = json['UpdatedAt'] != null ? UpdatedAt.fromJson(json['UpdatedAt']) : null;
  }
  String? id;
  String? userId;
  User? user;
  int? rating;
  String? comment;
  CreatedAt? createdAt;
  UpdatedAt? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['rating'] = rating;
    map['comment'] = comment;
    if (createdAt != null) {
      map['createdAt'] = createdAt?.toJson();
    }
    if (updatedAt != null) {
      map['UpdatedAt'] = updatedAt?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.username, 
      this.email, 
      this.password, 
      this.phone, 
      this.role, 
      this.blocked, 
      this.seller, 
      this.deliveryAddresses, 
      this.image, 
      this.refreshToken, 
      this.createdAt, 
      this.updatedAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    role = json['role'];
    blocked = json['blocked'];
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    if (json['deliveryAddresses'] != null) {
      deliveryAddresses = [];
      json['deliveryAddresses'].forEach((v) {
        deliveryAddresses?.add(DeliveryAddresses.fromJson(v));
      });
    }
    image = json['image'] != null ? Image1.fromJson(json['image']) : null;
    refreshToken = json['refreshToken'];
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    updatedAt = json['UpdatedAt'] != null ? UpdatedAt.fromJson(json['UpdatedAt']) : null;
  }
  String? id;
  String? username;
  String? email;
  String? password;
  String? phone;
  int? role;
  bool? blocked;
  Seller? seller;
  List<DeliveryAddresses>? deliveryAddresses;
  Image1? image;
  String? refreshToken;
  CreatedAt? createdAt;
  UpdatedAt? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    map['role'] = role;
    map['blocked'] = blocked;
    if (seller != null) {
      map['seller'] = seller?.toJson();
    }
    if (deliveryAddresses != null) {
      map['deliveryAddresses'] = deliveryAddresses?.map((v) => v.toJson()).toList();
    }
    if (image != null) {
      map['image'] = image?.toJson();
    }
    map['refreshToken'] = refreshToken;
    if (createdAt != null) {
      map['createdAt'] = createdAt?.toJson();
    }
    if (updatedAt != null) {
      map['UpdatedAt'] = updatedAt?.toJson();
    }
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

class DeliveryAddresses {
  DeliveryAddresses({
      this.id, 
      this.fullName, 
      this.phoneNumbers, 
      this.pincode, 
      this.state, 
      this.city, 
      this.houseOrBuildingNumber, 
      this.roadNameOrArea, 
      this.landmark, 
      this.type, 
      this.createdAt, 
      this.updatedAt,});

  DeliveryAddresses.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumbers = json['phone_numbers'] != null ? json['phone_numbers'].cast<String>() : [];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
    houseOrBuildingNumber = json['houseOrBuildingNumber'];
    roadNameOrArea = json['roadNameOrArea'];
    landmark = json['landmark'];
    type = json['type'];
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    updatedAt = json['updatedAt'] != null ? UpdatedAt.fromJson(json['updatedAt']) : null;
  }
  String? id;
  String? fullName;
  List<String>? phoneNumbers;
  String? pincode;
  String? state;
  String? city;
  String? houseOrBuildingNumber;
  String? roadNameOrArea;
  String? landmark;
  String? type;
  CreatedAt? createdAt;
  UpdatedAt? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fullName'] = fullName;
    map['phone_numbers'] = phoneNumbers;
    map['pincode'] = pincode;
    map['state'] = state;
    map['city'] = city;
    map['houseOrBuildingNumber'] = houseOrBuildingNumber;
    map['roadNameOrArea'] = roadNameOrArea;
    map['landmark'] = landmark;
    map['type'] = type;
    if (createdAt != null) {
      map['createdAt'] = createdAt?.toJson();
    }
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt?.toJson();
    }
    return map;
  }

}


class Seller {
  Seller({
      this.shopname, 
      this.phoneNumber, 
      this.aadhaarNumber, 
      this.collegename, 
      this.course, 
      this.academicyear, 
      this.pin, 
      this.admissionnumber, 
      this.idProof, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Seller.fromJson(dynamic json) {
    shopname = json['shopname'];
    phoneNumber = json['phone_number'];
    aadhaarNumber = json['aadhaarNumber'];
    collegename = json['collegename'];
    course = json['course'];
    academicyear = json['academicyear'];
    pin = json['pin'];
    admissionnumber = json['admissionnumber'];
    idProof = json['idProof'] != null ? IdProof.fromJson(json['idProof']) : null;
    status = json['status'];
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    updatedAt = json['updatedAt'] != null ? UpdatedAt.fromJson(json['updatedAt']) : null;
  }
  String? shopname;
  String? phoneNumber;
  String? aadhaarNumber;
  String? collegename;
  String? course;
  String? academicyear;
  String? pin;
  String? admissionnumber;
  IdProof? idProof;
  String? status;
  CreatedAt? createdAt;
  UpdatedAt? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['shopname'] = shopname;
    map['phone_number'] = phoneNumber;
    map['aadhaarNumber'] = aadhaarNumber;
    map['collegename'] = collegename;
    map['course'] = course;
    map['academicyear'] = academicyear;
    map['pin'] = pin;
    map['admissionnumber'] = admissionnumber;
    if (idProof != null) {
      map['idProof'] = idProof?.toJson();
    }
    map['status'] = status;
    if (createdAt != null) {
      map['createdAt'] = createdAt?.toJson();
    }
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt?.toJson();
    }
    return map;
  }

}


class IdProof {
  IdProof({
      this.name, 
      this.url,});

  IdProof.fromJson(dynamic json) {
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

class Image2 {
  Image2({
      this.name, 
      this.url,});

  Image2.fromJson(dynamic json) {
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