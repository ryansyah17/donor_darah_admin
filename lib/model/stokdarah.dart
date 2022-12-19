class StokDarah {
  bool? success;
  String? message;
  List<Data>? data;

  StokDarah({this.success, this.message, this.data});

  StokDarah.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  int? id;
  String? goldarahA;
  String? goldarahB;
  String? goldarahAb;
  String? goldarahO;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.goldarahA,
    this.goldarahB,
    this.goldarahAb,
    this.goldarahO,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goldarahA = json['goldarah_a'];
    goldarahB = json['goldarah_b'];
    goldarahAb = json['goldarah_ab'];
    goldarahO = json['goldarah_o'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['goldarah_a'] = goldarahA;
    data['goldarah_b'] = goldarahB;
    data['goldarah_ab'] = goldarahAb;
    data['goldarah_o'] = goldarahO;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
