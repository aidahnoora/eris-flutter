import 'package:erisrental/models/merk_model.dart';

class TransaksiModel {
  int? id;
  double? totalBayar;
  MerkModel? merk;
  String? tglSewa;
  String? tglKembali;
  int? userId;

  TransaksiModel({
    this.id,
    this.totalBayar,
    this.merk,
    this.tglSewa,
    this.tglKembali,
    this.userId,
  });

  TransaksiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalBayar = double.parse(json['total_bayar'].toString());
    tglSewa = json['tgl_sewa'];
    tglKembali = json['tgl_kembali'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_bayar': totalBayar,
      'tgl_sewa': tglSewa,
      'tgl_kembali': tglKembali,
      'user_id': userId,
    };
  }
}

class UninitializedTransaksiModel extends TransaksiModel {}
