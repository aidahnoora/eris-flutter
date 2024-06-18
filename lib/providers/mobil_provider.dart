import 'package:erisrental/models/mobil_model.dart';
import 'package:erisrental/services/mobil_service.dart';
import 'package:flutter/material.dart';

class MobilProvider with ChangeNotifier {
  List<MobilModel> _mobils = [];

  List<MobilModel> get mobils => _mobils;

  set mobils(List<MobilModel> mobils) {
    _mobils = mobils;
    notifyListeners();
  }

  Future<void> getMobils() async {
    try {
      List<MobilModel> mobils = await MobilService().getMobils();
      _mobils = mobils;
    } catch (e) {
      print(e);
    }
  }

}
