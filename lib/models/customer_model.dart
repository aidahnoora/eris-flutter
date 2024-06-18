class CustomerModel {
  int? id;
  String? nama;
  String? identitas;
  String? umur;
  String? noHp;
  String? alamat;
  String? jaminan;
  String? userId;

  CustomerModel({
    this.id,
    this.nama,
    this.identitas,
    this.umur,
    this.noHp,
    this.alamat,
    this.jaminan,
    this.userId,
  });

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json['customer'] != null) {
      id = json['id'];
      nama = json['customer']['nama'];
      identitas = json['customer']['identitas'];
      umur = json['customer']['umur'];
      noHp = json['customer']['no_hp'];
      alamat = json['customer']['alamat'];
      jaminan = json['customer']['jaminan'];
      userId = json['customer']['user_id'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'identitas': identitas,
      'umur': umur,
      'no_hp': noHp,
      'alamat': alamat,
      'jaminan': jaminan,
      'user_id': userId,
    };
  }
}
