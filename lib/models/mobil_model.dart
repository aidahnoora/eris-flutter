import 'package:erisrental/models/merk_model.dart';

class MobilModel {
  int? id;
  String? nama;
  String? model;
  String? tahunBuat;
  String? nomorPlat;
  String? kapasitas;
  String? bbm;
  double? harga;
  String? transmisi;
  String? image;
  MerkModel? merk;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? stok;

  MobilModel({
    this.id,
    this.nama,
    this.model,
    this.tahunBuat,
    this.nomorPlat,
    this.kapasitas,
    this.bbm,
    this.harga,
    this.transmisi,
    this.image,
    this.merk,
    this.createdAt,
    this.updatedAt,
    this.stok,
  });

  MobilModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    model = json['model'];
    tahunBuat = json['tahun_buat'];
    nomorPlat = json['nomor_plat'];
    kapasitas = json['kapasitas'];
    bbm = json['bbm'];
    harga = double.parse(json['harga'].toString());
    transmisi = json['transmisi'];
    image = json['image'];
    merk = MerkModel.fromJson(json['merk']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    stok = json['stok'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'model': model,
      'tahun_buat': tahunBuat,
      'nomor_plat': nomorPlat,
      'kapasitas': kapasitas,
      'bbm': bbm,
      'harga': harga,
      'transmisi': transmisi,
      'image': image,
      'merk': merk?.toJson(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'stok': stok,
    };
  }
}

class UninitializedMobilModel extends MobilModel {}
