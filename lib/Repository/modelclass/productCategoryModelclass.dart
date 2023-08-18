class ProductCategoryModelclass {
  ProductCategoryModelclass({
      this.data,});

  ProductCategoryModelclass.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.cateType, 
      this.createdAt, 
      this.name, 
      this.product, 
      this.subCates, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    cateType = json['cateType'];
    createdAt = json['createdAt'] != null ? CreatedAt.fromJson(json['createdAt']) : null;
    name = json['name'];
    product = json['product'];
    subCates = json['subCates'];
    updatedAt = json['updatedAt'] != null ? UpdatedAt.fromJson(json['updatedAt']) : null;
  }
  String? id;
  String? cateType;
  CreatedAt? createdAt;
  String? name;
  dynamic product;
  dynamic subCates;
  UpdatedAt? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cateType'] = cateType;
    if (createdAt != null) {
      map['createdAt'] = createdAt?.toJson();
    }
    map['name'] = name;
    map['product'] = product;
    map['subCates'] = subCates;
    if (updatedAt != null) {
      map['updatedAt'] = updatedAt?.toJson();
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