class ProfileAddressModelclass {
  ProfileAddressModelclass({
      this.user,});

  ProfileAddressModelclass.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
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
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
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
  Image? image;
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

class Image {
  Image({
      this.name, 
      this.url,});

  Image.fromJson(dynamic json) {
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