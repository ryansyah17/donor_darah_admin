class PendonorResult {
  bool? success;
  String? message;
  Pendonor? data;

  PendonorResult({this.success, this.message, this.data});

  PendonorResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Pendonor.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Pendonor {
  int? idUsers;
  String? name;
  String? tempatLahir;
  String? tanggalLahir;
  String? jenisKelamin;
  String? alamat;
  String? nohp;
  String? goldarah;
  int? beratbadan;
  int? tekanandarah;
  int? kadarhb;
  String? tanggalDonor;
  String? updatedAt;
  String? createdAt;
  int? id;

  Pendonor({
    this.idUsers,
    this.name,
    this.tempatLahir,
    this.tanggalLahir,
    this.jenisKelamin,
    this.alamat,
    this.nohp,
    this.goldarah,
    this.beratbadan,
    this.tekanandarah,
    this.kadarhb,
    this.tanggalDonor,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Pendonor.fromJson(Map<String, dynamic> json) {
    idUsers = json['id_users'];
    name = json['name'];
    tempatLahir = json['tempat_lahir'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    alamat = json['alamat'];
    nohp = json['nohp'];
    goldarah = json['goldarah'];
    beratbadan = json['beratbadan'];
    tekanandarah = json['tekanandarah'];
    kadarhb = json['kadarhb'];
    tanggalDonor = json['tanggal_donor'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_users'] = idUsers;
    data['name'] = name;
    data['tempat_lahir'] = tempatLahir;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_kelamin'] = jenisKelamin;
    data['alamat'] = alamat;
    data['nohp'] = nohp;
    data['goldarah'] = goldarah;
    data['beratbadan'] = beratbadan;
    data['tekanandarah'] = tekanandarah;
    data['kadarhb'] = kadarhb;
    data['tanggal_donor'] = tanggalDonor;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
