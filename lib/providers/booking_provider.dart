import 'package:erisrental/models/cart_model.dart';
import 'package:erisrental/services/booking_service.dart';
import 'package:flutter/material.dart';

class BookingProvider with ChangeNotifier {
  Future<bool> booking(String token, List<CartModel> carts,
      DateTime tanggalSewa, DateTime tanggalKembali, int durasiSewa) async {
    try {
      if (await BookingService()
          .booking(token, carts, tanggalSewa, tanggalKembali, durasiSewa)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
