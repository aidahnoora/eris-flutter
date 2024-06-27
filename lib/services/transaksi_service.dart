import 'dart:convert';
import 'package:erisrental/config.dart';
import 'package:erisrental/models/transaksi_model.dart';
import 'package:http/http.dart' as http;

class TransaksiService {
  Future<List<TransaksiModel>> getTransaksis(String token) async {
    var url = Uri.parse('${AppConfig.baseUrl}/transaksis');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      url, 
      headers: headers
    );

    // Debugging print statements
    print('Request URL: $url');
    print('Request Headers: $headers');
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<TransaksiModel> transaksis = [];

      for (var item in data) {
        transaksis.add(TransaksiModel.fromJson(item));
      }

      return transaksis;
    } else {
      throw Exception('Gagal Get Transaksi!');
    }
  }
}
