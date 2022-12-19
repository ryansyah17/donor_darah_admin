// class Notifikasi {
//   final int? id;
//   final String? nama;
//   final String? golDarah;
//   final String? banyak;
//   final String? lokasi;
//   final String? kontak;

//   Notifikasi({
//     this.id,
//     this.nama,
//     this.golDarah,
//     this.banyak,
//     this.lokasi,
//     this.kontak,
//   });
// }

class NotificationResult {
  bool? success;
  String? messaage;
  List<Notifications>? data;

  NotificationResult({this.success, this.messaage, this.data});

  NotificationResult.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    messaage = json['messaage'];
    if (json['data'] != null) {
      data = <Notifications>[];
      json['data'].forEach((v) {
        data!.add(Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['messaage'] = messaage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  int? id;
  String? name;
  String? umur;
  String? alamat;
  String? kebutuhanDarah;
  String? goldarah;
  String? resusDarah;
  String? kontak;
  String? createdAt;
  String? updatedAt;

  Notifications({
    this.id,
    this.name,
    this.umur,
    this.alamat,
    this.kebutuhanDarah,
    this.goldarah,
    this.resusDarah,
    this.kontak,
    this.createdAt,
    this.updatedAt,
  });

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    umur = json['umur'];
    alamat = json['alamat'];
    kebutuhanDarah = json['kebutuhan_darah'];
    goldarah = json['goldarah'];
    resusDarah = json['resus_darah'];
    kontak = json['kontak'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['umur'] = umur;
    data['alamat'] = alamat;
    data['kebutuhan_darah'] = kebutuhanDarah;
    data['goldarah'] = goldarah;
    data['resus_darah'] = resusDarah;
    data['kontak'] = kontak;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

List<Notifications> mocknotifikasi = [
  Notifications(
    id: 1,
    name: 'tono',
    goldarah: 'O',
    kebutuhanDarah: '5',
    alamat: 'bukittinggi',
    kontak: '082237636363',
  ),
  Notifications(
    id: 2,
    name: 'tano',
    goldarah: 'O',
    kebutuhanDarah: '5',
    alamat: 'bukittinggi',
    kontak: '082237636363',
  ),
  Notifications(
    id: 3,
    name: 'trrrsdno',
    goldarah: 'O',
    kebutuhanDarah: '5',
    alamat: 'bukittinggi',
    kontak: '082237636363',
  ),
];
