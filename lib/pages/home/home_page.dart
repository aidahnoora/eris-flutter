import 'package:erisrental/providers/mobil_provider.dart';
import 'package:flutter/material.dart';
import 'package:erisrental/theme.dart';
import 'package:erisrental/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  String? searchText;

  @override
  Widget build(BuildContext context) {
    MobilProvider mobilProvider = Provider.of<MobilProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: priceColor,
        centerTitle: true,
        title: Text(
          'Home',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget popularProducts() {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(defaultMargin),
                child: Text(
                  'Eris Rental Mobil',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari ...',
                        hintStyle: blackTextStyle.copyWith(
                          fontSize: 12,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: blackColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: blackTextStyle,
                      onChanged: (value) {
                        searchText =
                            value; // Update nilai searchText saat teks berubah
                        mobilProvider
                            .notifyListeners(); // Panggil notifyListeners() untuk update tampilan
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: blackColor,
                  ),
                  onPressed: () {
                    // Menerapkan logika pencarian
                    mobilProvider.mobils = mobilProvider.mobils
                        .where((mobil) =>
                            searchText == null || searchText!.isEmpty
                                ? true
                                : mobil.nama!
                                    .toLowerCase()
                                    .contains(searchText!.toLowerCase()))
                        .toList();
                    mobilProvider
                        .notifyListeners(); // Panggil notifyListeners() untuk update tampilan
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(defaultMargin),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: mobilProvider.mobils
                  .where((mobil) => searchText == null || searchText!.isEmpty
                      ? true
                      : mobil.nama!
                          .toLowerCase()
                          .contains(searchText!.toLowerCase()))
                  .map((mobil) {
                return ProductCard(mobil);
              }).toList(),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          popularProducts(),
        ],
      ),
    );
  }
}
