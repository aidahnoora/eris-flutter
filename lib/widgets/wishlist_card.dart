import 'package:erisrental/models/transaksi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:erisrental/theme.dart';

class WishlistCard extends StatelessWidget {
  // const WishlistCard({super.key});
  final TransaksiModel transaksi;
  const WishlistCard(this.transaksi, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2.0, color: priceColor)
      ),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: blackTextStyle,
                ),
                Text(
                  'Rp ${transaksi.totalBayar}',
                  style: priceTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tanggal Sewa',
                  style: blackTextStyle,
                ),
                Text(
                  '${transaksi.tglSewa}',
                  style: priceTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tanggal Kembali',
                  style: blackTextStyle,
                ),
                Text(
                  '${transaksi.tglKembali}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
