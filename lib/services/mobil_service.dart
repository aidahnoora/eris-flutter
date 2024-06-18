import 'dart:convert';
import 'package:erisrental/config.dart';
import 'package:erisrental/models/mobil_model.dart';
import 'package:http/http.dart' as http;

class MobilService {
  Future<List<MobilModel>> getMobils() async {
    var url = Uri.parse('${AppConfig.baseUrl}/cars');
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(
      url, 
      headers: headers
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<MobilModel> mobils = [];

      for (var item in data) {
        mobils.add(MobilModel.fromJson(item));
      }

      return mobils;
    } else {
      throw Exception('Gagal Get Mobil!');
    }
  }
}
