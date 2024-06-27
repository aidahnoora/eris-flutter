import 'package:erisrental/models/transaksi_model.dart';
import 'package:erisrental/services/transaksi_service.dart';
import 'package:flutter/material.dart';

class TransaksiProvider with ChangeNotifier {
  List<TransaksiModel> _transaksis = [];

  List<TransaksiModel> get transaksis => _transaksis;

  Future<void> getTransaksis(String token, int userId) async {
    try {
      List<TransaksiModel> transaksis =
          await TransaksiService().getTransaksis(token);

      // Filter transaksi berdasarkan userId
      _transaksis = transaksis.where((transaksi) => transaksi.userId == userId).toList();

      // Debugging print statements
      print('Transaksi Provider: Transaksi count: ${_transaksis.length}');
      for (var transaksi in _transaksis) {
        print('Transaksi user id: ${transaksi.userId}');
      }

      notifyListeners();
    } catch (e) {
      print(e);
      throw Exception('Gagal mendapatkan history transaksi.');
    }
  }
}
