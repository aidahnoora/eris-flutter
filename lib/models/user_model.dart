class UserModel {
  int? id;
  String? email;
  String? nama;
  String? identitas;
  String? umur;
  String? noHp;
  String? alamat;
  String? jaminan;
  String? token;

  UserModel({
    this.id,
    this.email,
    this.nama,
    this.identitas,
    this.umur,
    this.noHp,
    this.alamat,
    this.jaminan,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    if (json['customer'] != null) {
      nama = json['customer']['nama'];
      identitas = json['customer']['identitas'];
      umur = json['customer']['umur'];
      noHp = json['customer']['no_hp'];
      alamat = json['customer']['alamat'];
      jaminan = json['customer']['jaminan'];
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'nama': nama,
      'identitas': identitas,
      'umur': umur,
      'no_hp': noHp,
      'alamat': alamat,
      'jaminan': jaminan,
      'token': token,
    };
  }
}
