import 'package:erisrental/models/cart_model.dart';
import 'package:erisrental/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:erisrental/theme.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  void initState() {
    super.initState();
    // Ini tidak diperlukan lagi karena tanggal sewa dan kembali ada di CartProvider
  }

  Future<void> _selectDate(BuildContext context, DateTime initialDate,
      Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != initialDate)
      setState(() {
        onDateSelected(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    // ubah ip address local disini (sesuaikan dengan ip address saat di ipconfig)
    String baseurl = 'http://192.168.0.105:8000';
    
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    int durasiSewa = cartProvider.tglKembali.difference(cartProvider.tglSewa).inDays;
    widget.cart.subtotal = durasiSewa * widget.cart.mobil.harga!;

    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration:
          BoxDecoration(border: Border.all(width: 2.0, color: priceColor)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${baseurl}/storage/posts/${widget.cart.mobil.image}'),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${widget.cart.mobil.merk?.nama}',
                            style: blackTextStyle),
                        GestureDetector(
                            onTap: () {
                              cartProvider.removeCart(widget.cart.mobil);
                            },
                            child: Image.asset('assets/icon_remove.png',
                                width: 10)),
                      ],
                    ),
                    Text('${widget.cart.mobil.nama}',
                        style: blackTextStyle.copyWith(fontWeight: semiBold)),
                    Text('${widget.cart.mobil.tahunBuat}',
                        style: priceTextStyle),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal Sewa',
                            style: blackTextStyle.copyWith(fontWeight: semiBold)),
                        GestureDetector(
                          onTap: () => _selectDate(context, cartProvider.tglSewa,
                              (date) => cartProvider.setTglSewa(date)),
                          child: Text(
                              DateFormat('yyyy-MM-dd').format(cartProvider.tglSewa),
                              style: priceTextStyle),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tanggal Kembali',
                            style: blackTextStyle.copyWith(fontWeight: semiBold)),
                        GestureDetector(
                          onTap: () => _selectDate(context, cartProvider.tglKembali,
                              (date) => cartProvider.setTglKembali(date)),
                          child: Text(
                              DateFormat('yyyy-MM-dd').format(cartProvider.tglKembali),
                              style: priceTextStyle),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Durasi',
                            style: blackTextStyle.copyWith(fontWeight: semiBold)),
                        SizedBox(height: 2),
                        Text(durasiSewa.toString(),
                            style: blackTextStyle.copyWith(fontWeight: medium)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Rp. ${widget.cart.subtotal}',
                style: priceTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
