enum JenisKelamin { laki_laki, perempuan }

enum Goldarah { a, b, ab, o }

enum Roles { user, admin, superadmin }

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? alamat;
  final List<JenisKelamin>? jenis_kelamin;
  final List<Goldarah>? goldarah;
  final List<Roles>? roles;
  final String? profil_pictures;
  final String? access_token;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.alamat,
    this.jenis_kelamin,
    this.goldarah,
    this.roles,
    this.profil_pictures,
    this.access_token,
  });

  factory User.fromJson(map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      alamat: map['alamat'],
      jenis_kelamin: map['jenis_kelamin'],
      goldarah: map['goldarah'],
      roles: map['roles'],
      profil_pictures: map['profil_pictures'],
      access_token: map['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'alamat': alamat,
      'jenis_kelamin': jenis_kelamin,
      'goldarah': goldarah,
      'roles': roles,
      'profil_pictures': profil_pictures,
      'access_token': access_token,
    };
  }
}
