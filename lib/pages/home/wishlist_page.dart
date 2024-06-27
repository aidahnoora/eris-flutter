import 'package:erisrental/models/user_model.dart';
import 'package:erisrental/providers/auth_provider.dart';
import 'package:erisrental/providers/transaksi_provider.dart';
import 'package:flutter/material.dart';
import 'package:erisrental/theme.dart';
import 'package:erisrental/widgets/wishlist_card.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    TransaksiProvider transaksiProvider = Provider.of<TransaksiProvider>(context);
    transaksiProvider.getTransaksis(user.token!, user.id!); // Pass userId

    Widget header() {
      return AppBar(
        backgroundColor: priceColor,
        centerTitle: true,
        title: Text(
          'Transaksi Penyewaan',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: primaryTextColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image_wishlist.png',
                width: 74,
              ),
              const SizedBox(
                height: 23,
              ),
              Text(
                'Belum ada transaksi',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: priceColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
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
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: primaryTextColor,
          child: Consumer<TransaksiProvider>(
            builder: (context, transaksiProvider, child) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: transaksiProvider.transaksis
                    .map((transaksi) => WishlistCard(transaksi))
                    .toList(),
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          Consumer<TransaksiProvider>(
            builder: (context, transaksiProvider, child) {
              return transaksiProvider.transaksis.isEmpty
                  ? emptyWishlist()
                  : content();
            },
          ),
        ],
      ),
    );
  }
}
