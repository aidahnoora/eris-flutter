class MerkModel {
  int? id;
  String? nama;

  MerkModel({
    this.id,
    this.nama,
  });

  MerkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
    };
  }
}
