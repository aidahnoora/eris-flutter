import 'package:erisrental/models/transaksi_model.dart';
import 'package:erisrental/services/transaksi_service.dart';
import 'package:flutter/material.dart';

class TransaksiProvider with ChangeNotifier {
  List<TransaksiModel> _transaksis = [];

  List<TransaksiModel> get transaksis => _transaksis;

  Future<void> getTransaksis(String token) async {
    try {
      List<TransaksiModel> transaksis =
          await TransaksiService().getTransaksis(token);
      _transaksis = transaksis;

      notifyListeners();
    } catch (e) {
      print(e);
      throw Exception('Gagal mendapatkan history transaksi.');
    }
  }
}
