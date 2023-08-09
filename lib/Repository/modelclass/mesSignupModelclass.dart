class MesSignupModelclass {
  MesSignupModelclass({
      this.id, 
      this.message,});

  MesSignupModelclass.fromJson(dynamic json) {
    id = json['id'];
    message = json['message'];
  }
  String? id;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message'] = message;
    return map;
  }

}