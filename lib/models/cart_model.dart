import 'package:erisrental/models/mobil_model.dart';

class CartModel {
  final MobilModel mobil;
  double? subtotal;

  CartModel({
    required this.mobil,
    this.subtotal,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        mobil: MobilModel.fromJson(json['mobil']),
        subtotal: double.parse(json['subtotal']),
      );

  // get durasiSewa => 0;

  DateTime get tglSewa => DateTime.now();

  DateTime get tglKembali => DateTime.now();

  Map<String, dynamic> toJson() => {
        'mobil': mobil.toJson(),
        'subtotal': subtotal,
      };

  double getTotalPrice(int durasiSewa) => mobil.harga! * durasiSewa;
}

class CartDetail {
  int? durasiSewa;
  DateTime tglSewa;
  DateTime tglKembali;

  CartDetail({
    this.durasiSewa,
    required this.tglSewa,
    required this.tglKembali,
  });

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
        durasiSewa: json['durasi_sewa'],
        tglSewa: DateTime.parse(json['tgl_sewa']),
        tglKembali: DateTime.parse(json['tgl_kembali']),
      );

  Map<String, dynamic> toJson() => {
        'durasi_sewa': durasiSewa,
        'tgl_sewa': tglSewa.toString(),
        'tgl_kembali': tglKembali.toString(),
      };
}
