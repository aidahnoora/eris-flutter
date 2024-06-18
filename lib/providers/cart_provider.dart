import 'package:erisrental/models/cart_model.dart';
import 'package:erisrental/models/mobil_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _carts = [];
  DateTime _tglKembali = DateTime.now();
  DateTime _tglSewa = DateTime.now();

  List<CartModel> get carts => _carts;
  DateTime get tglKembali => _tglKembali;
  DateTime get tglSewa => _tglSewa;
  int get durasiSewa {
    return _tglKembali.difference(_tglSewa).inDays;
  }

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  setTglKembali(DateTime date) {
    _tglKembali = date;
    notifyListeners();
  }

  setTglSewa(DateTime date) {
    _tglSewa = date;
    notifyListeners();
  }

  addCart(MobilModel mobil) {
    if (mobilExist(mobil)) {
      int index = _carts.indexWhere(
        (element) => element.mobil.id == mobil.id,
      );
      print('Mobil sudah ada di dalam keranjang.');
    } else {
      _carts.add(
        CartModel(
          mobil: mobil,
          subtotal: 0,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(MobilModel mobil) {
    int index = _carts.indexWhere(
      (element) => element.mobil.id == mobil.id,
    );
    _carts.removeAt(index);
    notifyListeners();
  }

  double totalPrice() {
    double subtotal = 0;
    for (var item in _carts) {
      subtotal += (durasiSewa * item.mobil.harga!);
    }
    return subtotal;
  }

  mobilExist(MobilModel mobil) {
    if (_carts.indexWhere((element) => element.mobil.id == mobil.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
