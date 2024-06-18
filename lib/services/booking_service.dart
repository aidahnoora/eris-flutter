import 'dart:convert';
import 'package:erisrental/config.dart';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class BookingService {
  Future<bool> booking(String token, List<CartModel> carts,
      DateTime tanggalSewa, DateTime tanggalKembali, int durasiSewa) async {
    var url = Uri.parse('${AppConfig.baseUrl}/booking');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    // Hitung total bayar
    double totalBayar = carts.fold(0, (sum, cart) => sum + cart.subtotal!);

    // Format tanggal
    String formatTanggal(DateTime date) {
      return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
    }

    var body = jsonEncode(
      {
        'tgl_sewa': formatTanggal(tanggalSewa ?? DateTime.now()),
        'tgl_kembali': formatTanggal(tanggalKembali ?? DateTime.now()),
        'durasi_sewa': durasiSewa ?? 0,
        'total_bayar': totalBayar ?? 0,
        'items': carts
            .map(
              (cart) => {
                'id': cart.mobil.id,
                'subtotal': cart.subtotal,
              },
            )
            .toList(),
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan booking!');
    }
  }
}
