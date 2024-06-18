import 'package:erisrental/models/mobil_model.dart';
import 'package:erisrental/pages/product_page.dart';
import 'package:erisrental/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:erisrental/theme.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  // const ProductCard({super.key});

  final MobilModel mobil;
  ProductCard(this.mobil);

  @override
  Widget build(BuildContext context) {
    // ubah ip address local disini (sesuaikan dengan ip address saat di ipconfig)
    String baseurl = 'http://192.168.0.105:8000';

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (_) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: primaryTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Image.asset('assets/icon_success.png', width: 100),
                  const SizedBox(height: 12),
                  Text(
                    'Sukses!',
                    style: priceTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Mobil berhasil ditambahkan',
                    style: priceTextStyle,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: priceColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Lihat Penyewaan',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: 215,
      height: 278,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: priceColor),
        color: const Color(0xffECEDEF),
      ),
      child: Column(
        children: [
          Image.network(
            '${baseurl}/storage/posts/${mobil.image}',
            width: 215,
            height: 130,
            fit: BoxFit.contain, // Mengubah BoxFit menjadi cover
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${mobil.nama}',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Rp. ${mobil.harga}/hari',
                    style: priceTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    'Transmisi : ${mobil.transmisi}',
                    style: priceTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 30,
                          child: TextButton(
                            onPressed: () {
                              cartProvider.addCart(mobil);
                              showSuccessDialog();
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: successColor,
                            ),
                            child: Text(
                              'Rental',
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductPage(mobil)));
                            },
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: priceColor,
                            ),
                            child: Text(
                              'Detail',
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
