import 'package:erisrental/models/cart_model.dart';
import 'package:erisrental/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:erisrental/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutCard extends StatelessWidget {
  // const CheckoutCard({super.key});

  CartModel cart;
  CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    // ubah ip address local disini (sesuaikan dengan ip address saat di ipconfig)
    String baseurl = 'http://192.168.0.105:8000';

    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 12,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          decoration:
              BoxDecoration(border: Border.all(width: 2.0, color: priceColor)),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${baseurl}/storage/posts/${cart.mobil.image}',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cart.mobil.nama}',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    Text(
                      'Rp ${cart.mobil.harga}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Text(
                    '${cart.subtotal}',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                  Text(
                    '${cartProvider.durasiSewa} Hari',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: defaultMargin,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: priceColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rincian Penyewaan',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                  Text(
                    '1',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tanggal Sewa',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(cartProvider.tglSewa),
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tanggal Kembali',
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(cartProvider.tglKembali),
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(
                thickness: 1,
                color: Color(0xff2E3141),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    'Rp ${cart.subtotal}',
                    style: priceTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
