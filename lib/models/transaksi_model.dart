import 'package:erisrental/models/merk_model.dart';

class TransaksiModel {
  int? id;
  double? totalBayar;
  MerkModel? merk;
  String? tglSewa;
  String? tglKembali;

  TransaksiModel({
    this.id,
    this.totalBayar,
    this.merk,
    this.tglSewa,
    this.tglKembali,
  });

  TransaksiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalBayar = double.parse(json['total_bayar'].toString());
    tglSewa = json['tgl_sewa'];
    tglKembali = json['tgl_kembali'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_bayar': totalBayar,
      'tgl_sewa': tglSewa,
      'tgl_kembali': tglKembali,
    };
  }
}

class UninitializedTransaksiModel extends TransaksiModel {}
